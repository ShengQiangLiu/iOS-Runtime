//
//  MySubLoadTest.m
//  OC +load vs +initialize
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "MySubLoadTest.h"

@implementation MySubLoadTest

+ (void)load
{
    NSLog(@"%@", NSStringFromClass(self));
}

@end
