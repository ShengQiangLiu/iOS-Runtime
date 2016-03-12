//
//  UIView+Gesture.m
//  OC-AssociatedObjects
//
//  Created by admin on 16/3/12.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "UIView+Gesture.h"
#import <objc/runtime.h>

static char  * const kActionHandlerTapBlockKey = "kActionHandlerTapBlockKey";

@implementation UIView (Gesture)

- (void)eq_addTapActionWithBlock:(GestureActionBlock)block
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eq_handleActionForTapGesture:)];
    [self addGestureRecognizer:gesture];
    /*设置block对象关联*/
    objc_setAssociatedObject(self, kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)eq_handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GestureActionBlock block = objc_getAssociatedObject(self, kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

@end
