//
//  BNRAppDelegate.m
//  Hypnosister
//
//  Created by Yang Chen on 7/21/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisView.h"

@interface BNRAppDelegate () <UIScrollViewDelegate>

@property (nonatomic, strong) BNRHypnosisView *hypnosisView;

@end

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
////    CGRect firstFrame = CGRectMake(160, 240, 100, 150);
//    CGRect firstFrame = self.window.bounds;
//    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:firstFrame];
////    firstView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:firstView];

    // Create CGRects for frames
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = NO;
    
    scrollView.delegate = self;
    scrollView.contentSize = bigRect.size;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 2.0;
    
    [self.window addSubview:scrollView];
    
//    // Create a super-sized hypnosis view and add it to the scroll view
//    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    // Create a screen-sized hypnosis view and add it to the scroll view
    self.hypnosisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    [scrollView addSubview:self.hypnosisView];
    
//    // Add a second screen-sized hypnosis view just off screen to the right
//    screenRect.origin.x += screenRect.size.width;
//    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
//    [scrollView addSubview:anotherView];
    
    // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.hypnosisView;
}

@end
