//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LolayNumberPair : NSObject

@property (nonatomic, retain, readonly) NSNumber* key;
@property (nonatomic, retain, readonly) NSString* value;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path;

- (id) initWithKey:(NSNumber*) inKey value:(NSString*) inValue;

@end