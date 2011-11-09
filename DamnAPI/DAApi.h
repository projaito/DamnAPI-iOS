//
//  DAApi.h
//  DamnAPI
//
//  Created by James Apple Tang on 09/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAApi : NSObject

@property (nonatomic, strong) NSDictionary *body;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSDictionary *headers;

@end
