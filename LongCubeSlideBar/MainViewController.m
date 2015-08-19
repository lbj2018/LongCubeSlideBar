//
//  MainViewController.m
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "MainViewController.h"
#import "LeftMenuViewController.h"
#import "CenterViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    self.leftMenuViewController = [[LeftMenuViewController alloc] init]; 
    
    [super viewDidLoad];
    
//    CenterViewController *centerVC = [[CenterViewController alloc] init];
//    centerVC.view.backgroundColor = [UIColor redColor];
//    [self showCenterWithController:[[UINavigationController alloc] initWithRootViewController:centerVC]];
}

@end
