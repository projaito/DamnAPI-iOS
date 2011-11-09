//
//  DASpecViewController.h
//  DamnAPI
//
//  Created by James Apple Tang on 06/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAApiSpec;
@class DAApi;
@class DAApiGroups;

@interface DASpecViewController : UITableViewController {
    __strong UITextView *_responseView;
    __strong NSOperationQueue *_queue;
    __strong UIActivityIndicatorView  *_loadingIndicator;
}

@property (nonatomic, strong) NSString *specURL;
@property (nonatomic, strong) NSDictionary *response;
@property (nonatomic, strong) DAApiSpec    *spec;

- (id)initWithURL:(NSString *)specURL;
- (void)reloadSpec;
- (void)showLoadingState:(BOOL)isLoading;
- (DAApi *)apiForIndexPath:(NSIndexPath *)indexPath;
- (DAApiGroups *)apiGroupForSection:(NSInteger)section;

@end
