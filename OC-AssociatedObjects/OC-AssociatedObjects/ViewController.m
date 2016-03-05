//
//  ViewController.m
//  OC-AssociatedObjects
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AssociatedObjects.h"

@interface ViewController ()

@end

__weak NSString *string_weak_assign = nil;
__weak NSString *string_weak_retain = nil;
__weak NSString *string_weak_copy   = nil;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.associatedObject_assign = [NSString stringWithFormat:@"runtime1"];
    self.associatedObject_retain = [NSString stringWithFormat:@"runtime2"];
    self.associatedObject_copy   = [NSString stringWithFormat:@"runtime3"];
    
    string_weak_assign = self.associatedObject_assign;
    string_weak_retain = self.associatedObject_retain;
    string_weak_copy   = self.associatedObject_copy;

    NSLog(@"self.associatedObject_assign: %@", self.associatedObject_assign); // Will Crash
    NSLog(@"self.associatedObject_retain: %@", self.associatedObject_retain);
    NSLog(@"self.associatedObject_copy:   %@", self.associatedObject_copy);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"self.associatedObject_assign: %@", self.associatedObject_assign); // Will Crash
    NSLog(@"self.associatedObject_retain: %@", self.associatedObject_retain);
    NSLog(@"self.associatedObject_copy:   %@", self.associatedObject_copy);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
