//
//  MyInitializeTest.m
//  OC +load vs +initialize
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "MyInitializeTest.h"

@implementation MyInitializeTest

+ (void)initialize
{
    NSLog(@"%@", NSStringFromClass(self));
}

@end
