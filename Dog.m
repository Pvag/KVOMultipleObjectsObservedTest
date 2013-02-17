//
//  Dog.m
//  KVOMultipleObjectsObservedTest
//
//  Created by P_VaG on 17/02/13.
//  Copyright (c) 2013 P_VaG. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (id)init {
    self = [super init];
    if (self) {
        self.hunger = [NSNumber numberWithInt:2];
    }
    return self;
}

- (NSString *)description {
    return self.name;
}

- (void)thank:(Person *)person {
    NSLog(@"Hi, i'm %@. Thanks %@ for feeding me!", self, person);
}

@end
