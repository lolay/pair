//
//  Created by Lolay, Inc.
//  Copyright 2011 Lolay, Inc. All rights reserved.
//
#import "LolayNamePair.h"

@interface LolayNamePair ()

@property (nonatomic, retain, readwrite) NSString* name;
@property (nonatomic, retain, readwrite) NSString* rawDetail;
@property (nonatomic, assign, readwrite) BOOL localized;

@end

@implementation LolayNamePair

@synthesize name = name_;
@dynamic detail;
@synthesize rawDetail = rawDetail_;
@synthesize localized = localized_;

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path {
	return [LolayNamePair arrayWithContentsOfFile:path localized:NO];
}

+ (NSArray*) arrayWithContentsOfFile:(NSString*) path localized:(BOOL) localized {
	DLog(@"enter path=%@", path);
	NSArray* sourcePairs = [NSArray arrayWithContentsOfFile:path];
	NSMutableArray* pairs = [[NSMutableArray alloc] initWithCapacity:sourcePairs.count];
	
	for (NSArray* sourcePair in sourcePairs) {
		LolayNamePair* pair = [[LolayNamePair alloc] initWithName:[sourcePair objectAtIndex:0] detail:[sourcePair objectAtIndex:1]];
		[pairs addObject:pair];
	}
	
	return pairs;
}

- (id) initWithName:(NSString*) inName detail:(NSString*) inDetail {
	return [self initWithName:inName detail:inDetail localized:NO];
}

- (id) initWithName:(NSString*) inName detail:(NSString*) inDetail localized:(BOOL) localized {
	self = [super init];
	
	if (self) {
		self.name = inName;
		self.rawDetail = inDetail;
		self.localized = localized;
	}
	
	return self;
}

+ (LolayNamePair*) pairWithName:(NSString*) inName detail:(NSString*) inDetail {
	return [LolayNamePair pairWithName:inName detail:inDetail localized:NO];
}

+ (LolayNamePair*) pairWithName:(NSString*) inName detail:(NSString*) inDetail localized:(BOOL) localized {
	return [[LolayNamePair alloc] initWithName:inName detail:inDetail localized:localized];
}

@end