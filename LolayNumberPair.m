//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import "LolayNumberPair.h"

@interface LolayNumberPair ()

@property (nonatomic, retain, readwrite) NSNumber* key;
@property (nonatomic, retain, readwrite) NSString* value;

@end

@implementation LolayNumberPair

@synthesize key = key_;
@synthesize value = value_;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path {
	DLog(@"enter path=%@", path);
	NSArray* sourcePairs = [[NSArray arrayWithContentsOfFile:path] retain];
	NSMutableArray* pairs = [[NSMutableArray alloc] initWithCapacity:sourcePairs.count];
	
	for (NSArray* sourcePair in sourcePairs) {
		LolayNumberPair* pair = [[LolayNumberPair alloc] initWithKey:[sourcePair objectAtIndex:0] value:[sourcePair objectAtIndex:1]];
		[pairs addObject:pair];
		[pair release];
	}
	
	[sourcePairs release];
	
	return [pairs autorelease];
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
	self = [super init];
	
	if (self) {
		self.key = inKey;
		self.value = inValue;
	}
	
	return self;
}

- (void) dealloc {
	self.key = nil;
	self.value = nil;
	
	[super dealloc];
}

@end