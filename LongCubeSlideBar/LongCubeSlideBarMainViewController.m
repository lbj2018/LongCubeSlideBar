//
//  LongCubeSlideBarMainViewController.m
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "LongCubeSlideBarMainViewController.h"

@interface LongCubeSlideBarMainViewController () 
@property (strong, nonatomic) UIView *leftMenuContainerView;
@property (strong, nonatomic) UIView *centerContainerView;
@property (nonatomic) CGFloat finalLeftEdge;
@property (nonatomic) CGFloat initialLeftEdge;
@property (nonatomic) BOOL canStartSlide;
@end

@implementation LongCubeSlideBarMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)setupView {
    [self setupContainerView];
    if (self.leftMenuViewController) {
        self.leftMenuViewController.delegate = self;
        self.leftMenuViewController.mainVC = self;

        [self addLeftMenuViewController:self.leftMenuViewController];
//        [self addChildViewController:self.leftMenuViewController];
//        [self.leftMenuContainerView addSubview:self.leftMenuViewController.view];
        
        self.centerViewController = [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
        [self addCenterViewController:self.centerViewController];
    } else {
        @throw [NSException exceptionWithName:@"LongCubeSlideBarMainViewController"
                                       reason:@"self.leftMenuViewController and self.centerViewController cannot be nil"
                                     userInfo:nil];
    }
}

- (void)addCenterViewController:(UIViewController *)vc {
    [self addChildViewController:vc];
    vc.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.centerContainerView addSubview:vc.view];
    
    NSDictionary *viewsDictionary = @{ @"centerContainerView":vc.view };
    
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[centerContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[centerContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.centerContainerView addConstraints:constraint_POS_H];
    [self.centerContainerView addConstraints:constraint_POS_V];
}

- (void)addLeftMenuViewController:(UIViewController *)vc {
    [self addChildViewController:vc];
    vc.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftMenuContainerView addSubview:vc.view];
    
    NSDictionary *viewsDictionary = @{ @"leftMenuContainerView":vc.view };
    
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[leftMenuContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[leftMenuContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.leftMenuContainerView addConstraints:constraint_POS_H];
    [self.leftMenuContainerView addConstraints:constraint_POS_V];
}

- (void)removeViewController:(UIViewController *)vc {
    [vc removeFromParentViewController];
    [vc.view removeFromSuperview];
}

- (void)setupContainerView {
    self.leftMenuContainerView = [[UIView alloc] init];
    self.leftMenuContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftMenuContainerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.leftMenuContainerView];
    
    self.centerContainerView = [[UIView alloc] init];
    self.centerContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.centerContainerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.centerContainerView];

    NSDictionary *viewsDictionary = @{ @"leftMenuContainerView":self.leftMenuContainerView,
                                       @"centerContainerView":self.centerContainerView };
    
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[leftMenuContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[leftMenuContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_H];
    [self.view addConstraints:constraint_POS_V];
    
    constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[centerContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[centerContainerView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_H];
    [self.view addConstraints:constraint_POS_V];
}

- (void)pan:(UIPanGestureRecognizer *)gesture {
    CGFloat translationX = [gesture translationInView:self.view].x;
//    CGFloat velocityX     = [gesture velocityInView:self.view].x;
    
        switch (gesture.state) {
            case UIGestureRecognizerStateBegan: {
                CGPoint locationInCenterView = [gesture locationInView:self.centerContainerView];
                if (CGRectContainsPoint(self.centerContainerView.bounds, locationInCenterView)) {
                    self.canStartSlide = YES;
                    CGRect newFrame = self.centerContainerView.frame;
                    self.initialLeftEdge = newFrame.origin.x;
                } else {
                    self.canStartSlide = NO;
                }
                break;
            }
            case UIGestureRecognizerStateChanged: {
                if (self.canStartSlide) {
                    CGRect newFrame = self.centerContainerView.frame;
                    newFrame.origin.x += translationX;
                    if (newFrame.origin.x < 0) newFrame.origin.x = 0;
                    if (newFrame.origin.x > self.view.bounds.size.width - 100) newFrame.origin.x = self.view.bounds.size.width - 100;
                    self.centerContainerView.frame = newFrame;
                }
                break;
            }
            case UIGestureRecognizerStateEnded:
            case UIGestureRecognizerStateCancelled:
            default: {
                if (self.canStartSlide) {
                    CGRect newFrame = self.centerContainerView.frame;
                    self.finalLeftEdge = newFrame.origin.x;
                    
                    [UIView animateWithDuration:0.2 animations:^{
                        if (self.finalLeftEdge > self.initialLeftEdge) {
                            [self moveCenterViewToRight];
                        } else {
                            [self moveCenterViewToCenter];
                        }
                    }];
                }
                break;
            }
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

- (void)showCenterWithController:(UIViewController *)vc {
    [self removeViewController:vc];
    [self addCenterViewController:vc];
    
    self.centerViewController = vc;
    
    [UIView animateWithDuration:0.2 animations:^{ [self moveCenterViewToCenter]; }];
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

#pragma mark - LongCubeSlideBarMenuViewControllerDelegate

- (void)slideBarMenuViewController:(LongCubeSlideBarMenuViewController *)controller didShowCenterWithController:(UIViewController *)centerVC {
    [self showCenterWithController:centerVC];
}

@end
