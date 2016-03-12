//
//  MySubInitializeTest+Category.m
//  OC +load vs +initialize
//
//  Created by admin on 16/3/12.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "MySubInitializeTest+Category.h"

@implementation MySubInitializeTest (Category)
+ (void)initialize
{
    NSLog(@"子类分类 : %@", NSStringFromClass(self));
}

+ (instancetype)myNew
{
    return [self new];
}

@end
