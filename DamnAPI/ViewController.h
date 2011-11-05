//
//  ViewController.h
//  DamnAPI
//
//  Created by James Apple Tang on 04/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate;

@interface ViewController : UITableViewController {
    NSMutableArray *_sections;
}

@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, assign) id <ViewControllerDelegate> delegate;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

@end


@protocol ViewControllerDelegate <NSObject>

@optional
- (void)viewControllerDidLoad:(ViewController *)viewController;
- (void)viewController:(ViewController *)viewController didSelectObject:(NSObject *)object atIndexPath:(NSIndexPath *)indexPath;

@end