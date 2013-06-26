//
//  AAppDelegate.h
//  AuditionTableView
//
//  Created by 贾玉辉 on 13-5-16.
//  Copyright (c) 2013年 Audition. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AListViewController;

@interface AAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AListViewController *viewController;

@end
