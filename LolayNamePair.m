//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import "LolayNamePair.h"

@interface LolayNamePair ()

@property (nonatomic, retain, readwrite) NSString* name;
@property (nonatomic, retain, readwrite) NSString* detail;

@end

@implementation LolayNamePair

@synthesize name = name_;
@synthesize detail = detail_;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path {
	DLog(@"enter path=%@", path);
	NSArray* sourcePairs = [[NSArray arrayWithContentsOfFile:path] retain];
	NSMutableArray* pairs = [[NSMutableArray alloc] initWithCapacity:sourcePairs.count];
	
	for (NSArray* sourcePair in sourcePairs) {
		LolayNamePair* pair = [[LolayNamePair alloc] initWithName:[sourcePair objectAtIndex:0] detail:[sourcePair objectAtIndex:1]];
		[pairs addObject:pair];
		[pair release];
	}
	
	[sourcePairs release];
	
	return [pairs autorelease];
}

- (id) initWithName:(NSString*) inName detail:(NSString*) inDetail {
	self = [super init];
	
	if (self) {
		self.name = inName;
		self.detail = inDetail;
	}
	
	return self;
}

+ (LolayNamePair*) pairWithName:(NSString*) inName detail:(NSString*) inDetail {
	return [[[LolayNamePair alloc] initWithName:inName detail:inDetail] autorelease];
}

- (void) dealloc {
	self.name = nil;
	self.detail = nil;
	
	[super dealloc];
}

@end