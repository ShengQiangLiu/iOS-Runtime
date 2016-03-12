//
//  UIView+Gesture.h
//  OC-AssociatedObjects
//
//  Created by admin on 16/3/12.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecognizer);

@interface UIView (Gesture)


- (void)eq_addTapActionWithBlock:(GestureActionBlock)block;

@end
