//
//  AppDelegate.h
//  DamnAPI
//
//  Created by James Apple Tang on 04/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class ViewControllerCoordinator;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) ViewControllerCoordinator *coordinator;

@end
