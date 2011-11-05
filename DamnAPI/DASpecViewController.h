//
//  DASpecViewController.h
//  DamnAPI
//
//  Created by James Apple Tang on 06/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DASpecViewController : UITableViewController {
    __strong UITextView *_responseView;
    __strong NSOperationQueue *_queue;
    __strong UIActivityIndicatorView  *_loadingIndicator;
}

@property (nonatomic, strong) NSString *specURL;
@property (nonatomic, strong) NSDictionary *response;

- (id)initWithURL:(NSString *)specURL;
- (void)reloadSpec;
- (void)showLoadingState:(BOOL)isLoading;
- (NSDictionary *)apiForIndexPath:(NSIndexPath *)indexPath;
- (NSDictionary *)apiGroupForSection:(NSInteger)section;

@end
