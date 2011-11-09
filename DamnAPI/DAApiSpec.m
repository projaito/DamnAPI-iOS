//
//  DAApiSpec.m
//  DamnAPI
//
//  Created by James Apple Tang on 09/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DAApiSpec.h"

@implementation DAApiSpec
@synthesize host, api_groups, headers;


- (NSString *)description {
    NSString *desc = [NSString stringWithFormat:@"\n{"];
    desc = [desc stringByAppendingFormat:@"\n\thost: %@", host];
    desc = [desc stringByAppendingFormat:@"\n\tapi_groups:%@", api_groups];
    desc = [desc stringByAppendingFormat:@"\n\theaders:%@", headers];
    desc = [desc stringByAppendingFormat:@"}"];
    return desc;
}

@end
