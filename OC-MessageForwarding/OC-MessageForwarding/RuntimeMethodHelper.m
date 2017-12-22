//
//  RuntimeMethodHelper.m
//  OC-MessageForwarding
//
//  Created by admin on 16/3/12.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "RuntimeMethodHelper.h"

@implementation RuntimeMethodHelper
- (void)hello
{
    NSLog(@"%@, %p", self, _cmd);
}
- (void)hi
{
    NSLog(@"%@, %p", self, _cmd);
}
@end
