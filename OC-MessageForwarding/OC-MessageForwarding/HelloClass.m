//
//  HelloClass.m
//  OC-MessageForwarding
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "HelloClass.h"
#import <objc/runtime.h>

@implementation HelloClass

void functionForMethod(id self, SEL _cmd)
{
    NSLog(@"Hello!");
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    NSString *selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hi"])
    {
        class_addMethod(self, @selector(hello), (IMP)functionForMethod, "v@:");
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hello"])
    {
        class_addMethod(self, @selector(hello), (IMP)functionForMethod, "@:");
    }
    return [super resolveInstanceMethod:sel];
}

@end
