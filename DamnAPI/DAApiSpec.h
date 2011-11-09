//
//  DAApiSpec.h
//  DamnAPI
//
//  Created by James Apple Tang on 09/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAApiSpec : NSObject

@property (nonatomic, strong) NSArray *host;
@property (nonatomic, strong) NSArray *api_groups;
@property (nonatomic, strong) NSDictionary *headers;

@end
