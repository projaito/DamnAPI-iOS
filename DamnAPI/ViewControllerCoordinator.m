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
                                                        @"https://raw.github.com/gist/1338795/faa1f0056de928ce372b8db59c335523ef507a86/twitter_api.json",
                                                        nil]];
}

- (void)viewController:(ViewController *)viewController didSelectObject:(NSObject *)object atIndexPath:(NSIndexPath *)indexPath {
    DASpecViewController *controller = [[DASpecViewController alloc] initWithURL:(NSString *)object];
    [viewController.navigationController pushViewController:controller animated:YES];
}

@end