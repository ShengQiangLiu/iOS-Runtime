# iOS-Runtime


###一、类和对象
Objective-C 对象实际上是一个C里面的结构体指针，这个我们可以通过id类型理解，大家都知道id可以指向任意对象，id本身是一个对象，然后是个指针，所以它指向对象时，不要加“*”。

下面是id类型的定义：

	/// id 是一个指向 objc_object 结构体的指针.
	typedef struct objc_object *id;
	
Objective-C 类实际上也是一个C里面的结构体指针，这个我们通过Class类型理解。

	/// 一个不透明的类型代表一个Objective-C类.
	typedef struct objc_class *Class;

**那么 objc_object 和 objc_class 这两个结构体又表示了些什么东西？**

objc_object 结构体的定义：

	/// Represents an instance of a class.
	struct objc_object {
   	 	Class isa  OBJC_ISA_AVAILABILITY;
	};

objc_class 结构体的定义：

	struct objc_class {
    	Class isa  OBJC_ISA_AVAILABILITY;

	    Class super_class  						// 父类                                   
	    const char *name   						// 类名                                     
	    long version       						// 类的版本信息                                      
	    long info          						// 类信息，供运行期使用的一些位标识                                    
	    long instance_size                    	// 类的实例变量大小                  
	    struct objc_ivar_list *ivars           	// 类的成员变量链表                 
	    struct objc_method_list **methodLists  	// 方法定义的链表                  
	    struct objc_cache *cache               	// 方法缓存                  
	    struct objc_protocol_list *protocols   	// 协议链表                
		
	} OBJC2_UNAVAILABLE;

现在我们列出来了两个结构体的定义，发现了一个大问题，它们里面都有一个叫 isa 的变量。
这个 isa 是干什么的呢？看下图：

![image](/isa指针.png)

当对象初始化时，会分配内存，并初始化其成员变量，也就是为对象的结构体 objc_class 分配内存，让其中的 isa 指针可以访问类以及其继承体系。

也就是说当我们的对象是一个实例的时候，isa指向实例所属的类；当对象为类的时候，isa指向meta-class（元类）。

其它相关结构体中的参数，在消息机制中才会解释。元类这个我不作解释了。

总结：

1、Objective-C 的实例和类都是一个对象；
2、Objective-C 的对象实际上就是一个结构体；



###一、+load方法 和 +initialize方法

#####1、+load 方法

+load 方法是当类或分类被添加到 Objective-C runtime 时被调用的，实现这个方法可以让我们在类加载的时候执行一些类相关的行为。子类的 +load 方法会在它的所有父类的 +load 方法之后执行，而分类的 +load 方法会在它的主类的 +load 方法之后执行。但是不同的类之间的 +load 方法的调用顺序是不确定的。

子类 +load 方法等父类先执行完 +load 方法才执行。
分类 +load 方法会在它的主类 +load 方法之后执行


#####2、+initialize 方法

+initialize 方法是在类或它的子类收到第一条消息之前被调用的，这里所指的消息包括实例方法和类方法的调用。也就是说 +initialize 方法是以懒加载的方式被调用的，如果程序一直没有给某个类或它的子类发送消息，那么这个类的 +initialize 方法是永远不会被调用的。那这样设计有什么好处呢？好处是显而易见的，那就是节省系统资源，避免浪费。


runtime 使用了发送消息 objc_msgSend 的方式对 +initialize 方法进行调用。也就是说 +initialize 方法的调用与普通方法的调用是一样的，走的都是发送消息的流程。换言之，如果子类没有实现 +initialize 方法，那么继承自父类的实现会被调用；如果一个类的分类实现了 +initialize 方法，那么就会对这个类中的实现造成覆盖。

因此，如果一个子类没有实现 +initialize 方法，那么父类的实现是会被执行多次的。

###二、MethodSwizzling
#####1、Swizzling应该总是在+load中执行

在Objective-C中，运行时会自动调用每个类的两个方法。+load会在类初始加载时调用，+initialize会在第一次调用类的类方法或实例方法之前被调用。这两个方法是可选的，且只有在实现了它们时才会被调用。由于method swizzling会影响到类的全局状态，因此要尽量避免在并发处理中出现竞争的情况。+load能保证在类的初始化过程中被加载，并保证这种改变应用级别的行为的一致性。相比之下，+initialize在其执行时不提供这种保证—事实上，如果在应用中没为给这个类发送消息，则它可能永远不会被调用。

#####2、Swizzling应该总是在dispatch_once中执行
与上面相同，因为swizzling会改变全局状态，所以我们需要在运行时采取一些预防措施。原子性就是这样一种措施，它确保代码只被执行一次，不管有多少个线程。GCD的dispatch_once可以确保这种行为，我们应该将其作为method swizzling的最佳实践。

#####3、注意事项

Swizzling通常被称作是一种黑魔法，容易产生不可预知的行为和无法预见的后果。虽然它不是最安全的，但如果遵从以下几点预防措施的话，还是比较安全的：

   1、总是调用方法的原始实现(除非有更好的理由不这么做)：API提供了一个输入与输出约定，但其内部实现是一个黑盒。Swizzle一个方法而不调用原始实现可能会打破私有状态底层操作，从而影响到程序的其它部分。
   
   2、避免冲突：给自定义的分类方法加前缀，从而使其与所依赖的代码库不会存在命名冲突。
   
   3、明白是怎么回事：简单地拷贝粘贴swizzle代码而不理解它是如何工作的，不仅危险，而且会浪费学习Objective-C运行时的机会。阅读Objective-C Runtime Reference和查看<objc/runtime.h>头文件以了解事件是如何发生的。
   
   4、小心操作：无论我们对Foundation, UIKit或其它内建框架执行Swizzle操作抱有多大信心，需要知道在下一版本中许多事可能会不一样。
   
   
###三、
  
  
  
  
