//
//  Dog.h
//  KVOMultipleObjectsObservedTest
//
//  Created by P_VaG on 17/02/13.
//  Copyright (c) 2013 P_VaG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@interface Dog : NSObject

@property (strong, nonatomic) NSNumber *hunger;
@property (strong, nonatomic) NSString *name;

- (void)thank:(Person *)person;

@end

