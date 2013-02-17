//
//  main.m
//  KVOMultipleObjectsObservedTest
//
//  Created by P_VaG on 17/02/13.
//  Copyright (c) 2013 P_VaG. All rights reserved.
//


// This is a simple program to test the KVO technology.
// The project is composed of 2 classes: Person and Dog.
// In main() i set the instance of Person as observer of
// each of the two instances of Dog, observing the keyPath
// @"hunger", which is the name of a property in Dog.
// In Person i specify what to do if the valueForKeyPath:keyPath
// is @"hunger": if the value of hunger of the particular instance
// of Dog is higher than 4, the person must feed the instance
// of Dog who is hungry. I've added NSLogs in many points of
// the code to show where the code arrives after each
// of the important calls in the program.
//
// Remember that in
// - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
//      change:(NSDictionary *)change context:(void *)context
// i can obtain objects from the change dictionary via objectForKey:NSKeyValueChangeNewKey
// or NSKeyValueChangeOldKey or other arguments, if i prefer, but NOT
// using the string keyPath, since the keys in the change dictionary are created by
// the runtime environment and don't correspond to keyPath!
//
// Remember to removeObserver: when it is no longer needed
// and, anyway, before the observed object is deallocated.


#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Person *me = [[Person alloc] init];
        me.name = @"Paolo";
        Dog *dog1 = [[Dog alloc] init];
        dog1.name = @"Spillo"; // Spillo R.I.P.
        Dog *dog2 = [[Dog alloc] init];
        dog2.name = @"Fritz";
        
        [dog1 addObserver:me forKeyPath:@"hunger" options:NSKeyValueObservingOptionNew context:NULL];
        [dog2 addObserver:me forKeyPath:@"hunger" options:NSKeyValueObservingOptionNew context:nil];
        
        dog1.hunger = [NSNumber numberWithInt:10];
        dog2.hunger = [NSNumber numberWithInt:13];
        
        [dog1 removeObserver:me forKeyPath:@"hunger"];
        [dog2 removeObserver:me forKeyPath:@"hunger"];

    }
    return 0;
}

