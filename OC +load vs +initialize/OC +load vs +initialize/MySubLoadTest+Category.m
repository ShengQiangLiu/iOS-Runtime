//
//  MySubLoadTest+Category.m
//  OC +load vs +initialize
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "MySubLoadTest+Category.h"

@implementation MySubLoadTest (Category)

+ (void)load
{
    NSLog(@"Category -> %@", NSStringFromClass(self));
}


@end
