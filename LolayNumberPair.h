//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LolayNumberPair : NSObject

@property (nonatomic, retain, readonly) NSNumber* key;
@property (nonatomic, retain, readonly) NSString* value;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path;

+ (NSInteger) indexForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (NSInteger) indexForKey:(NSNumber*) inKey pairs:(NSArray*) pairs;
+ (NSNumber*) keyForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (NSString*) valueForKey:(NSNumber*) inKey pairs:(NSArray*) pairs;
+ (LolayNumberPair*) pairForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (LolayNumberPair*) pairForKey:(NSNumber*) inKey pairs:(NSArray*) pairs;

- (id) initWithKey:(NSNumber*) inKey value:(NSString*) inValue;

@end