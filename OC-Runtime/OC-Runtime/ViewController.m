//
//  ViewController.m
//  OC-Runtime
//
//  Created by Sniper on 15/12/10.
//  Copyright © 2015年 ShengQiang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "NSArray+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    Class obj = [[NSObject alloc] init];
//    NSLog(@"%@", obj);
//    
//    Class image = [[UIImage alloc] init];
//    NSLog(@"%@", image);
//    
//    id object = [[NSObject alloc] init];
//    NSLog(@"%@", object);

    
    
    NSArray *array = [[NSArray alloc] init];
    [array my_array];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
