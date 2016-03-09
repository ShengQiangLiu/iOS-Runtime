//
//  main.m
//  OC-Self&Super
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Son.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Son *son = [[Son alloc] init];
        
        [son myClass];
        
//        ((Class (*)(id, SEL))(void *)objc_msgSend)((id)son, sel_registerName("myClass"));

        const char *selName = [@"myClass" UTF8String];
        SEL sel = sel_registerName(selName);
        NSLog(@"%s", sel_getName(sel));
        NSLog(@"%p", sel);

        objc_msgSend();
        
        SEL sel2 = @selector(myClass);
        NSLog(@"%s", sel_getName(sel2));
        NSLog(@"%p", sel2);
        

        
    }
    return 0;
}
