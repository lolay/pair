//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LolayNamePair : NSObject

@property (nonatomic, retain, readonly) NSString* name;
@property (nonatomic, retain, readonly) NSString* detail;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path;

- (id) initWithName:(NSString*) inName detail:(NSString*) inDetail;
+ (LolayNamePair*) pairWithName:(NSString*) inName detail:(NSString*) inDetail;

@end