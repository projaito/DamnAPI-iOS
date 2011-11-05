//
//  ViewControllerCoordinator.h
//  DamnAPI
//
//  Created by James Apple Tang on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface ViewControllerCoordinator : NSObject

@end


@interface ViewControllerCoordinator (ViewController) <ViewControllerDelegate>

@end