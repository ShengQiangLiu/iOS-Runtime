//
//  HelloWorldClass.m
//  OC-Self&Super
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "HelloWorldClass.h"

@implementation HelloWorldClass

- (void)helloWorldMethod
{
    
    HelloWorldClass *obj = [[HelloWorldClass alloc] init];
    
    // 向实例对象发送 helloInstanceMethod 消息
    [obj helloInstanceMethod];
    
    [self helloInstanceMethod];
    
    // 向类对象 HelloWorldClass 发送 helloClassMethod 消息
    [HelloWorldClass helloClassMethod];
    
    // 向super  发送 helloInstanceMethod 消息
    [super helloInstanceMethod];
    
}

@end
