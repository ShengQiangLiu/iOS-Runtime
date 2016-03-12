//
//  UIViewController+MethodSwizzling.m
//  OC-MethodSwizzling
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "UIViewController+MethodSwizzling.h"
#include <objc/runtime.h>

@implementation UIViewController (MethodSwizzling)

/*
 +load 方法会在类加入运行期调用，这是把方法调配放在+load方法里面的原因
 */
+ (void)load
{
    static dispatch_once_t onceToken;
    /*单例保证并行情况下不会有问题*/
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(my_viewWillAppear);
        
        /*获取原来的方法*/
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        /*获取要替换的方法*/
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        /*originalSelector是否有实现，如果存在返回YES，不存在返回NO*/
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success)
        {
            /*修改要替换的方法实现为原有实现*/
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else
        {
            /*表示待交换的两个方法的实现*/
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

#pragma mark - Method Swizzling
/*
 看上去会递归调用，进入死循环。但是这个方法是准备和viewWillAppear方法交换的。在运行期，my_viewWillAppear 选择子实际上对应于原有的viewWillAppear方法实现。
 */
- (void)my_viewWillAppear
{
    [self my_viewWillAppear];
    NSLog(@"%s", __func__);
}

@end
