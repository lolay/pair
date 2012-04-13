//
//  Copyright 2012 Lolay, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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