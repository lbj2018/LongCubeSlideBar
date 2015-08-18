//
//  CenterViewController.h
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuAction.h"

@interface CenterViewController : UIViewController

@property (weak, nonatomic) id<MenuAction> menuAction;

@end
