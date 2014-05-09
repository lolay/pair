//
//  LolayPairTests.m
//  LolayPairTests
//
//  Created by Bruce Johnson on 5/9/14.
//  Copyright (c) 2014 Lolay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LolayPairGlobals.h"
#import "LolayNamePair.h"
#import "LolayNumberPair.h"
#import "LolayStringPair.h"

#define NAME "Lolay"
#define DETAIL "an iOS Development Company"

@interface LolayPairTests : XCTestCase

@property (nonatomic, strong, readwrite) LolayNamePair *namePair;

@end

@implementation LolayPairTests

- (void)setUp
{
    [super setUp];
	self.namePair = [[LolayNamePair alloc] initWithName: @NAME detail: @DETAIL];
}

- (void)tearDown
{
	self.namePair = nil;
    [super tearDown];
}

- (void)testNamePair
{
	XCTAssertNotNil(self.namePair.name, @"Wrong name value.");
}

@end
