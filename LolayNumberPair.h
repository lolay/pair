//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LolayNumberPair : NSObject

@property (nonatomic, strong, readonly) NSNumber* key;
@property (nonatomic, strong, readonly) NSString* value;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path;
+ (NSArray*) arrayWithContentsOfFile:(NSString*) path localized:(BOOL) localized;

+ (NSInteger) indexForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (NSInteger) indexForKey:(NSNumber*) inKey pairs:(NSArray*) pairs;
+ (NSNumber*) keyForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (NSString*) valueForKey:(NSNumber*) inKey pairs:(NSArray*) pairs;
+ (LolayNumberPair*) pairForValue:(NSString*) inValue pairs:(NSArray*) pairs;
+ (LolayNumberPair*) pairForKey:(NSNumber*) inKey pairs:(NSArray*) pairs;

- (id) initWithKey:(NSNumber*) inKey value:(NSString*) inValue;
- (id) initWithKey:(NSNumber*) inKey value:(NSString*) inValue localized:(BOOL) localized;
+ (LolayNumberPair*) pairWithKey:(NSNumber*) inKey value:(NSString*) value;
+ (LolayNumberPair*) pairWithKey:(NSNumber*) inKey value:(NSString*) value localized:(BOOL) localized;

@end