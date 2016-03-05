//
//  UIViewController+AssociatedObjects.h
//  OC-AssociatedObjects
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AssociatedObjects)
@property (nonatomic, assign) NSString *associatedObject_assign;
@property (nonatomic, strong) NSString *associatedObject_retain;
@property (nonatomic, copy) NSString *associatedObject_copy;

@property (nonatomic, strong) NSString *hello;

@end
