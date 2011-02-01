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

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path {
	NSLog(@"[LolayNumberPair arrayWithContentsOfFile] enter path=%@", path);
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