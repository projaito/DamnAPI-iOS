//
//  DASpecViewController.m
//  DamnAPI
//
//  Created by James Apple Tang on 06/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DASpecViewController.h"
#import "AFJSONRequestOperation.h"

@implementation DASpecViewController
@synthesize specURL;
@synthesize response;

- (id)initWithURL:(NSString *)aSpecURL {
    self = [super init];
    if (self) {
        self.specURL = [aSpecURL copy];
        _queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    _responseView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 260)];
    _responseView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _responseView.editable = NO;
    self.tableView.tableFooterView = _responseView;

    _loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_loadingIndicator hidesWhenStopped];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadSpec)];

    [self reloadSpec];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark Properties

- (void)setResponse:(NSDictionary *)aResponse {
    response = aResponse;
    [self.tableView reloadData];
}

#pragma mark Instance Method

- (void)showLoadingState:(BOOL)isLoading {
    if (isLoading) {
        self.navigationItem.rightBarButtonItem.customView = _loadingIndicator;
        [_loadingIndicator startAnimating];
    } else {
        self.navigationItem.rightBarButtonItem.customView = nil;
        [_loadingIndicator stopAnimating];
    }
}

- (void)reloadSpec {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.specURL]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        _responseView.text = [NSString stringWithFormat:@"%@", JSON];
        self.response = JSON;
        [self showLoadingState:NO];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        _responseView.text = [NSString stringWithFormat:@"%@", error];
        [self showLoadingState:NO];
    }];
    operation.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [self showLoadingState:YES];
    [_queue addOperation:operation];
}

- (NSDictionary *)apiForIndexPath:(NSIndexPath *)indexPath {
    return [[[self apiGroupForSection:indexPath.section] valueForKeyPath:@"apis"] objectAtIndex:indexPath.row];
}

- (NSDictionary *)apiGroupForSection:(NSInteger)section {
    return [[self.response valueForKeyPath:@"api_groups"] objectAtIndex:section];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.response objectForKey:@"api_groups"] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[self apiGroupForSection:section] valueForKeyPath:@"apis"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    NSDictionary *api = [self apiForIndexPath:indexPath];
    cell.textLabel.text = [api valueForKeyPath:@"name"];
    cell.detailTextLabel.text = [api valueForKeyPath:@"path"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self apiGroupForSection:section] valueForKeyPath:@"name"];
}

@end
