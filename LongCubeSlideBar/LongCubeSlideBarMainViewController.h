//
//  LongCubeSlideBarMainViewController.h
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuAction.h"
#import "LongCubeSlideBarMenuViewController.h"

@interface LongCubeSlideBarMainViewController : UIViewController <MenuAction, LongCubeSlideBarMenuViewControllerDelegate>

@property (strong, nonatomic) LongCubeSlideBarMenuViewController *leftMenuViewController;
@property (strong, nonatomic) UIViewController *centerViewController;

- (void)showCenterWithController:(UIViewController *)vc;

@end
