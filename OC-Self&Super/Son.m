//
//  Son.m
//  OC-Self&Super
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "Son.h"
#import <objc/runtime.h>


@implementation Son

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSLog(@"%@", NSStringFromClass([self myClass]));
        NSLog(@"%@", NSStringFromClass([super myClass]));
    }
    return self;
}

- (Class)myClass
{
    NSLog(@"Son myClass");
    return object_getClass(self);
}

@end
