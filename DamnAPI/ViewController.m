//
//  ViewController.m
//  DamnAPI
//
//  Created by James Apple Tang on 04/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize sections = _sections;
@synthesize delegate;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"DamnAPI";
    self.tableView.rowHeight = 60;
    
    if ([self.delegate respondsToSelector:@selector(viewControllerDidLoad:)]) {
        [self.delegate viewControllerDidLoad:self];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark Instance Method

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.minimumFontSize = 11;
        cell.textLabel.numberOfLines = 3;
        cell.textLabel.lineBreakMode = UILineBreakModeMiddleTruncation;
        cell.textLabel.font          = [UIFont systemFontOfSize:13];
    }

    cell.textLabel.text = [self objectAtIndexPath:indexPath];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.sections objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sections count];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(viewController:didSelectObject:atIndexPath:)]) {
        [self.delegate viewController:self didSelectObject:[self objectAtIndexPath:indexPath] atIndexPath:indexPath];
    }
}

@end
