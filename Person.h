//
//  Person.h
//  KVOMultipleObjectsObservedTest
//
//  Created by P_VaG on 17/02/13.
//  Copyright (c) 2013 P_VaG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;

- (void)feed:(Dog *)dog;

@end