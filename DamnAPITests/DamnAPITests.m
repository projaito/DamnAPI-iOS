//
//  DamnAPITests.m
//  DamnAPITests
//
//  Created by James Apple Tang on 04/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DamnAPITests.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

@implementation DamnAPITests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//- (void)testExample
//{
//    STFail(@"Unit tests are not implemented yet in DamnAPITests");
//}

- (void)testRequestOperation {

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://raw.github.com/gist/1337052/440ddabe955b40fccb70ea2460ac182925af7e4c/api_spec.json"]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    }];

    // The response is text/plain type for gist response,
    // by default AFJSONRequestOperation doesn't expected and would result in error.
    operation.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];

    [queue waitUntilAllOperationsAreFinished];

    NSLog(@"error %@", operation.error);
    STAssertNil(operation.error, @"%@", operation.error);
    
    NSLog(@"responseJSON %@", operation.responseJSON);
    STAssertNotNil(operation.responseJSON, @"Should contain responseJSON", nil);
}


//- (void)testGetJSON {
//    [[AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"https://raw.github.com"]]
//     getPath:@"/gist/1337052/440ddabe955b40fccb70ea2460ac182925af7e4c/api_spec.json"
//     parameters:nil
//     success:^(id object) {
//         NSLog(@"object %@", object);
//     } failure:^(NSHTTPURLResponse *response, NSError *error) {
//         NSLog(@"error %@", error);
//     }];
//}

@end
