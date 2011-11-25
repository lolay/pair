//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LolayNamePair : NSObject

@property (nonatomic, strong, readonly) NSString* name;
@property (nonatomic, strong, readonly) NSString* detail;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path;
+ (NSArray*) arrayWithContentsOfFile:(NSString*) path localized:(BOOL) localized;

- (id) initWithName:(NSString*) inName detail:(NSString*) inDetail;
- (id) initWithName:(NSString*) inName detail:(NSString*) inDetail localized:(BOOL) localized;
+ (LolayNamePair*) pairWithName:(NSString*) inName detail:(NSString*) inDetail;
+ (LolayNamePair*) pairWithName:(NSString*) inName detail:(NSString*) inDetail localized:(BOOL) localized;

@end
