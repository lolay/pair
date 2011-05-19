//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import "LolayStringPair.h"

@interface LolayStringPair ()

@property (nonatomic, retain, readwrite) NSString* key;
@property (nonatomic, retain, readwrite) NSString* value;

@end

@implementation LolayStringPair

@synthesize key = key_;
@synthesize value = value_;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path {
	DLog(@"enter path=%@", path);
	NSArray* sourcePairs = [[NSArray arrayWithContentsOfFile:path] retain];
	NSMutableArray* pairs = [[NSMutableArray alloc] initWithCapacity:sourcePairs.count];
	
	for (NSArray* sourcePair in sourcePairs) {
		LolayStringPair* pair = [[LolayStringPair alloc] initWithKey:[sourcePair objectAtIndex:0] value:[sourcePair objectAtIndex:1]];
		[pairs addObject:pair];
		[pair release];
	}
	
	[sourcePairs release];
	
	return [pairs autorelease];
}

+ (NSInteger) indexForValue:(NSString*) inValue pairs:(NSArray*) pairs {
	NSInteger i = 0;
	for (LolayStringPair* pair in pairs) {
		if ([inValue isEqualToString:pair.value]) {
			return i;
		}
		i++;
	}
	return -1;
}

+ (NSInteger) indexForKey:(NSString*) inKey pairs:(NSArray*) pairs {
	NSInteger i = 0;
	for (LolayStringPair* pair in pairs) {
		if ([inKey isEqualToString:pair.key]) {
			return i;
		}
		i++;
	}
	return -1;
}

+ (NSString*) keyForValue:(NSString*) inValue pairs:(NSArray*) pairs {
	return [self pairForValue:inValue pairs:pairs].key;
}

+ (NSString*) valueForKey:(NSString*) inKey pairs:(NSArray*) pairs {
	return [self pairForKey:inKey pairs:pairs].value;
}

+ (LolayStringPair*) pairForValue:(NSString*) inValue pairs:(NSArray*) pairs {
	for (LolayStringPair* pair in pairs) {
		if (pair.value != nil && [inValue isEqualToString:pair.value]) {
			return pair;
		}
	}
	return nil;
}

+ (LolayStringPair*) pairForKey:(NSString*) inKey pairs:(NSArray*) pairs {
	for (LolayStringPair* pair in pairs) {
		if (pair.key != nil && [inKey isEqualToString:pair.key]) {
			return pair;
		}
	}
	return nil;
}

- (id) initWithKey:(NSString*) inKey value:(NSString*) inValue {
	self = [super init];
	
	if (self) {
		self.key = inKey;
		self.value = inValue;
	}
	
	return self;
}

+ (LolayStringPair*) pairWithKey:(NSString*) inKey value:(NSString*) inValue {
	return [[[LolayStringPair alloc] initWithKey:inKey value:inValue] autorelease];
}

- (void) dealloc {
	self.key = nil;
	self.value = nil;
	
	[super dealloc];
}

@end