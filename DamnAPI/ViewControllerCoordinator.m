//
//  ViewControllerCoordinator.m
//  DamnAPI
//
//  Created by James Apple Tang on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewControllerCoordinator.h"
#import "DASpecViewController.h"

@implementation ViewControllerCoordinator

@end


@implementation ViewControllerCoordinator (ViewController)

- (void)viewControllerDidLoad:(ViewController *)viewController {
    viewController.sections = [NSArray arrayWithObject:[NSArray arrayWithObjects:
                                                        @"https://raw.github.com/gist/1337052/440ddabe955b40fccb70ea2460ac182925af7e4c/api_spec.json",
                                                        @"https://gist.github.com/raw/1338795/32dc957af4b80d9c2f18cd2605e97a0b1986ee20/twitter_api.json",
                                                        @"https://gist.github.com/raw/1338795/7ca35c07a7f28c608d5cf64651baa6090a8165a6/twitter_api.json",
                                                        nil]];
}

- (void)viewController:(ViewController *)viewController didSelectObject:(NSObject *)object atIndexPath:(NSIndexPath *)indexPath {
    DASpecViewController *controller = [[DASpecViewController alloc] initWithURL:(NSString *)object];
    [viewController.navigationController pushViewController:controller animated:YES];
}

@end