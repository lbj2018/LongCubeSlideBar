//
//  LeftMenuViewController.h
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "LongCubeSlideBarMenuViewController.h"
#import "CenterViewController.h"

@interface LeftMenuViewController : LongCubeSlideBarMenuViewController

@property (strong, nonatomic) CenterViewController *redColorCenterVC;
@property (strong, nonatomic) CenterViewController *greenColorCenterVC;
@property (strong, nonatomic) CenterViewController *blueColorCenterVC;

@end
