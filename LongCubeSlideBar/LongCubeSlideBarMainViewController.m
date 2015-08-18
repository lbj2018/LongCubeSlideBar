//
//  LongCubeSlideBarMainViewController.m
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "LongCubeSlideBarMainViewController.h"
#import "LongCubeSlideBarMenuViewController.h"
#import "CenterViewController.h"

@interface LongCubeSlideBarMainViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftMenuContainerView;
@property (weak, nonatomic) IBOutlet UIView *centerContainerView;
@property (nonatomic) CGFloat finalLeftEdge;
@property (nonatomic) CGFloat initialLeftEdge;
@end

@implementation LongCubeSlideBarMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)setupView {
    LongCubeSlideBarMenuViewController *leftMenuVC = [[LongCubeSlideBarMenuViewController alloc] init];
    
    [self addChildViewController:leftMenuVC];
    [self.leftMenuContainerView addSubview:leftMenuVC.view];
    
    CenterViewController *centerVC = [[CenterViewController alloc] init];
    centerVC.menuAction = self;
    UINavigationController *centerNVC = [[UINavigationController alloc] initWithRootViewController:centerVC];
    
    [self addChildViewController:centerNVC];
    [self.centerContainerView addSubview:centerNVC.view];
}

- (void)pan:(UIPanGestureRecognizer *)gesture {
    CGFloat translationX = [gesture translationInView:self.view].x;
//    CGFloat velocityX     = [gesture velocityInView:self.view].x;

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGRect newFrame = self.centerContainerView.frame;
            self.initialLeftEdge = newFrame.origin.x;
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGRect newFrame = self.centerContainerView.frame;
            newFrame.origin.x += translationX;
            if (newFrame.origin.x < 0) newFrame.origin.x = 0;
            if (newFrame.origin.x > self.view.bounds.size.width - 100) newFrame.origin.x = self.view.bounds.size.width - 100;
            self.centerContainerView.frame = newFrame;
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            CGRect newFrame = self.centerContainerView.frame;
            self.finalLeftEdge = newFrame.origin.x;
            
            [UIView animateWithDuration:0.2 animations:^{
                if (self.finalLeftEdge > self.initialLeftEdge) {
                    [self moveCenterViewToRight];
                } else {
                    [self moveCenterViewToCenter];
                }
            }];
            break;
        }
        default: break;
    }
    [gesture setTranslation:CGPointZero inView:self.view];
}

- (void)moveCenterViewToRight {
    CGRect newFrame = self.centerContainerView.frame;
    newFrame.origin.x = self.view.bounds.size.width - 100;
    self.centerContainerView.frame = newFrame;
}

- (void)moveCenterViewToCenter {
    CGRect newFrame = self.centerContainerView.frame;
    newFrame.origin.x = 0;
    self.centerContainerView.frame = newFrame;
}

#pragma mark - MenuAction

- (void)showMenuWithAnimation:(BOOL)animation {
    CGFloat locationX = self.centerContainerView.frame.origin.x;
    [UIView animateWithDuration:0.2 animations:^{
        if (locationX > 0) {
            [self moveCenterViewToCenter];
        } else {
            [self moveCenterViewToRight];
        }
    }];
}

@end
