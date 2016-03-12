//
//  ViewController.m
//  OC-MethodSwizzling
//
//  Created by Sniper on 16/3/3.
//  Copyright © 2016年 ShengQiang. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+MethodSwizzling.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//- (void)my_viewWillAppear
//{
//    [super my_viewWillAppear];
    
//}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
