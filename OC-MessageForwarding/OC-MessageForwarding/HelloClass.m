//
//  HelloClass.m
//  OC-MessageForwarding
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "HelloClass.h"
#import <objc/runtime.h>
#import "RuntimeMethodHelper.h"

@interface HelloClass ()
{
    RuntimeMethodHelper *_helper;
}
@end

@implementation HelloClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _helper = [RuntimeMethodHelper new];
    }
    return self;
}


void functionForMethod(id self, SEL _cmd)
{
    NSLog(@"Hello!");
}

Class functionForClassMethod(id self, SEL _cmd)
{
    NSLog(@"Hi!");
    return [HelloClass class];
}

#pragma mark - 1、动态方法解析
+ (BOOL)resolveClassMethod:(SEL)sel
{
    NSLog(@"resolveClassMethod");
    NSString *selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hi"])
    {
        Class metaClass = objc_getMetaClass("HelloClass");
        class_addMethod(metaClass, @selector(hi), (IMP)functionForClassMethod, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"resolveInstanceMethod");

    NSString *selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hello"])
    {
        class_addMethod(self, @selector(hello), (IMP)functionForMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

#pragma mark - 2、备用接收者
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"forwardingTargetForSelector");
    
    NSString *selectorString = NSStringFromSelector(aSelector);
    
    // 将消息交给_helper来处理
    if ([selectorString isEqualToString:@"hello"]) {
        return _helper;
    }
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 3、完整消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"forwardInvocation");
    if ([RuntimeMethodHelper instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_helper];
    }
}

/*必须重新这个方法，消息转发机制使用从这个方法中获取的信息来创建NSInvocation对象*/
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature)
    {
        if ([RuntimeMethodHelper instancesRespondToSelector:aSelector])
        {
            signature = [RuntimeMethodHelper instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

@end
