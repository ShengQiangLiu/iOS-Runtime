//
//  main.m
//  OC-Self&Super
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Son.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Son *son = [[Son alloc] init];
        
//        [son myClass];
        
//        ((Class (*)(id, SEL))(void *)objc_msgSend)((id)son, sel_registerName("myClass"));

        NSString *obj = [[NSString alloc] init];
        NSInteger count = [obj length];
        
        
        SEL sel = @selector(length);
        NSLog(@"%s", sel_getName(sel));
        NSLog(@"%p", sel);
        
        const char *selName = [@"length" UTF8String];
        SEL sel2 = sel_registerName(selName);
        NSLog(@"%s", sel_getName(sel2));
        NSLog(@"%p", sel2);
        
        SEL sel3 = NSSelectorFromString(@"length");
        NSLog(@"%s", sel_getName(sel3));
        NSLog(@"%p", sel3);
        
        NSLog(@"%d", sel_isEqual(sel, sel2));
        NSLog(@"%d", sel_isEqual(sel2, sel3));
        

        
    }
    return 0;
}
