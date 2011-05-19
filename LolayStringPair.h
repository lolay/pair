//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LolayStringPair : NSObject

@property (nonatomic, retain, readonly) NSString* key;
@property (nonatomic, retain, readonly) NSString* value;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path;

+ (NSInteger) indexForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (NSInteger) indexForKey:(NSString*) inKey pairs:(NSArray*) pairs;
+ (NSString*) keyForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (NSString*) valueForKey:(NSString*) inKey pairs:(NSArray*) pairs;
+ (LolayStringPair*) pairForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (LolayStringPair*) pairForKey:(NSString*) inKey pairs:(NSArray*) pairs;

- (id) initWithKey:(NSString*) inKey value:(NSString*) inValue;
+ (LolayStringPair*) pairWithKey:(NSString*) inKey value:(NSString*) inValue;

@end