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
#import "LolayNumberPair.h"
#import "LolayPairGlobals.h"

@interface LolayNumberPair ()

@property (nonatomic, strong, readwrite) NSNumber* key;
@property (nonatomic, strong, readwrite) NSString* rawValue;
@property (nonatomic, assign, readwrite) BOOL localized;

@end

@implementation LolayNumberPair

@synthesize key = key_;
@dynamic value;
@synthesize rawValue = rawValue_;
@synthesize localized = localized_;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path {
	return [LolayNumberPair arrayWithContentsOfFile:path localized:NO];
}

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path localized:(BOOL) localized {
	DLog(@"enter path=%@", path);
	NSArray* sourcePairs = [NSArray arrayWithContentsOfFile:path];
	NSMutableArray* pairs = [[NSMutableArray alloc] initWithCapacity:sourcePairs.count];
	
	for (NSArray* sourcePair in sourcePairs) {
		LolayNumberPair* pair = [[LolayNumberPair alloc] initWithKey:[sourcePair objectAtIndex:0] value:[sourcePair objectAtIndex:1] localized:localized];
		[pairs addObject:pair];
	}
	
	return pairs;
}

+ (NSInteger) indexForValue:(NSString*) inValue pairs:(NSArray*) pairs {
	NSInteger i = 0;
	for (LolayNumberPair* pair in pairs) {
		if ([inValue isEqualToString:pair.value]) {
			return i;
		}
		i++;
	}
	return -1;
}

+ (NSInteger) indexForKey:(NSNumber*) inKey pairs:(NSArray*) pairs {
	NSInteger i = 0;
	for (LolayNumberPair* pair in pairs) {
		if ([inKey isEqualToNumber:pair.key]) {
			return i;
		}
		i++;
	}
	return -1;
}

+ (NSNumber*) keyForValue:(NSString*) inValue pairs:(NSArray*) pairs {
	return [self pairForValue:inValue pairs:pairs].key;
}

+ (NSString*) valueForKey:(NSNumber*) inKey pairs:(NSArray*) pairs {
	return [self pairForKey:inKey pairs:pairs].value;
}

+ (LolayNumberPair*) pairForValue:(NSString*) inValue pairs:(NSArray*) pairs {
	for (LolayNumberPair* pair in pairs) {
		if (pair.value != nil && [inValue isEqualToString:pair.value]) {
			return pair;
		}
	}
	return nil;
}

+ (LolayNumberPair*) pairForKey:(NSNumber*) inKey pairs:(NSArray*) pairs {
	for (LolayNumberPair* pair in pairs) {
		if (pair.key != nil && [inKey isEqualToNumber:pair.key]) {
			return pair;
		}
	}
	return nil;
}

- (id) initWithKey:(NSNumber*) inKey value:(NSString*) inValue {
	return [self initWithKey:inKey value:inValue localized:NO];
}

- (id) initWithKey:(NSNumber*) inKey value:(NSString*) inValue localized:(BOOL) localized {
	self = [super init];
	
	if (self) {
		self.key = inKey;
		self.rawValue = inValue;
		self.localized = localized;
	}
	
	return self;
}

+ (LolayNumberPair*) pairWithKey:(NSNumber*) inKey value:(NSString*) value {
	return [LolayNumberPair pairWithKey:inKey value:value localized:NO];
}

+ (LolayNumberPair*) pairWithKey:(NSNumber*) inKey value:(NSString*) value localized:(BOOL) localized {
	return [[LolayNumberPair alloc] initWithKey:inKey value:value localized:localized];
}

- (NSString*) value {
	return self.localized ? NSLocalizedString(self.rawValue, nil) : self.rawValue;
}

@end