//
//  Person.m
//  KVOMultipleObjectsObservedTest
//
//  Created by P_VaG on 17/02/13.
//  Copyright (c) 2013 P_VaG. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"hunger"]) {
        NSLog(@"%@ has been notified via KVO that %@'s hunger has changed to: %@.", self, object, [change objectForKey:NSKeyValueChangeNewKey]);
        // Only feed the dog if he's really hungry
        if ([[change objectForKey:NSKeyValueChangeNewKey] integerValue] > 4) {
            // The instance of Person can feed the appropriate instance of Dog
            // using the parameter (id)object . This realizes a real communication
            // between objects at runtime!
            [self feed:object];
        }
    }
}

- (NSString *)description {
    return self.name;
}

// Importing Dog.h i can use the method thank:
// of Dog.
// The instance of Dog can communicate with the instance of Person
// that feeds him, thanks to the object passed as argument to thank.
- (void)feed:(Dog *)dog {
    NSLog(@"%@ has fed %@.", self, dog);
    [dog thank:self];
}

@end
