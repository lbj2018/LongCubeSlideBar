//
//  CenterViewController.m
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()
@property (strong, nonatomic) UIBarButtonItem *menuBarButtonItem;
@end

@implementation CenterViewController

- (UIBarButtonItem *)menuBarButtonItem {
    if (!_menuBarButtonItem) {
        _menuBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(showMenu:)];
    }
    return _menuBarButtonItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationItem *item = self.navigationItem;
    self.navigationItem.leftBarButtonItem = self.menuBarButtonItem;
}

- (void)showMenu:(id)sender {
    [self.menuAction showMenuWithAnimation:YES];
}

@end
