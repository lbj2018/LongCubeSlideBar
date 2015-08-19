//
//  LeftMenuViewController.m
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LongCubeSlideBarMainViewController.h"

@interface LeftMenuViewController ()
@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.delegate slideBarMenuViewController:self
                  didShowCenterWithController:[[UINavigationController alloc] initWithRootViewController:self.redColorCenterVC]];
}

- (CenterViewController *)redColorCenterVC {
    if (!_redColorCenterVC) {
        _redColorCenterVC = [[CenterViewController alloc] init];
        _redColorCenterVC.view.backgroundColor = [UIColor purpleColor];
        _redColorCenterVC.menuAction = self.mainVC;
    }
    return _redColorCenterVC;
}

- (CenterViewController *)greenColorCenterVC {
    if (!_greenColorCenterVC) {
        _greenColorCenterVC = [[CenterViewController alloc] init];
        _greenColorCenterVC.view.backgroundColor = [UIColor greenColor];
        _greenColorCenterVC.menuAction = self.mainVC;
    }
    return _greenColorCenterVC;
}

- (CenterViewController *)blueColorCenterVC {
    if (!_blueColorCenterVC) {
        _blueColorCenterVC = [[CenterViewController alloc] init];
        _blueColorCenterVC.view.backgroundColor = [UIColor blueColor];
        _blueColorCenterVC.menuAction = self.mainVC;
    }
    return _blueColorCenterVC;
}

- (IBAction)redColor:(id)sender {
    [self.delegate slideBarMenuViewController:self
                  didShowCenterWithController:[[UINavigationController alloc] initWithRootViewController:self.redColorCenterVC]];
}

- (IBAction)greenColor:(id)sender {
    [self.delegate slideBarMenuViewController:self
                  didShowCenterWithController:[[UINavigationController alloc] initWithRootViewController:self.greenColorCenterVC]];
}

- (IBAction)blueColor:(id)sender {
    [self.delegate slideBarMenuViewController:self
                  didShowCenterWithController:[[UINavigationController alloc] initWithRootViewController:self.blueColorCenterVC]];
}

@end
