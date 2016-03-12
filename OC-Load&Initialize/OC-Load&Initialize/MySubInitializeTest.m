//
//  MySubInitializeTest.m
//  OC +load vs +initialize
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "MySubInitializeTest.h"

@implementation MySubInitializeTest


+ (void)initialize
{
    NSLog(@"子类：%@", NSStringFromClass(self));
}


@end
