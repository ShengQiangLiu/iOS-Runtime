//
//  MyLoadTest+Category.m
//  OC +load vs +initialize
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "MyLoadTest+Category.h"

@implementation MyLoadTest (Category)

+ (void)load
{
    NSLog(@"Category -> %@", NSStringFromClass(self));
}

@end
