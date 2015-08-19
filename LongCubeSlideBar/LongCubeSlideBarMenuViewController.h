//
//  LongCubeSlideBarMenuViewController.h
//  LongCube
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 zhou dengfeng derek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuAction.h"

@class LongCubeSlideBarMainViewController;
@protocol LongCubeSlideBarMenuViewControllerDelegate;

@interface LongCubeSlideBarMenuViewController : UIViewController

@property (weak, nonatomic) LongCubeSlideBarMainViewController *mainVC;
@property (weak, nonatomic) id<LongCubeSlideBarMenuViewControllerDelegate> delegate;

@end

@protocol LongCubeSlideBarMenuViewControllerDelegate <NSObject>

- (void)slideBarMenuViewController:(LongCubeSlideBarMenuViewController *)controller
       didShowCenterWithController:(UIViewController *)centerVC;

@end
