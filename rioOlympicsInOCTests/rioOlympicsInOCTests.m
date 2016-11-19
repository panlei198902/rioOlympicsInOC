//
//  rioOlympicsInOCTests.m
//  rioOlympicsInOCTests
//
//  Created by derex pan on 2016/11/13.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EventDAO.h"
#import "Events.h"
#import "DBHelper.h"
#import "BaseDAO.h"
@interface rioOlympicsInOCTests : XCTestCase

@property (nonatomic, strong) EventDAO *dao;
@property (nonatomic, strong) Events *theEvents;

@end

@implementation rioOlympicsInOCTests

- (void)setUp {
    [super setUp];
    self.dao = [EventDAO sharedInstance];
    
    self.theEvents = [[Events alloc] init];
    self.theEvents.EventName = @"test EventName";
    self.theEvents.EventIcon = @"test EventIcon";
    self.theEvents.KeyInfo = @"test KeyInfo";
    self.theEvents.BasicsInfo = @"test BasicsInfo";
    self.theEvents.OlympicInfo = @"test OlympicInfo";
    
    
}

- (void)tearDown {
    self.dao = nil;
    [super tearDown];
}

- (void)test_1_findByKey {
    self.theEvents.EventID = 41;
    Events *resEvents = [self.dao findByKey:self.theEvents];
    XCTAssertNotNil(resEvents,@"查询记录为Nil");
    
    XCTAssertEqualObjects(self.theEvents.EventName, resEvents.EventName);
    XCTAssertEqualObjects(self.theEvents.EventIcon, resEvents.EventIcon);
    XCTAssertEqualObjects(self.theEvents.KeyInfo, resEvents.KeyInfo);
    XCTAssertEqualObjects(self.theEvents.BasicsInfo, resEvents.BasicsInfo);
    XCTAssertEqualObjects(self.theEvents.OlympicInfo, resEvents.OlympicInfo);
    
}



- (void)test_2_findAll {
    NSArray *list = [self.dao findAll];
    XCTAssertEqual([list count], 41);
    
    Events *resEvents = list[40];
    
    XCTAssertEqualObjects(self.theEvents.EventIcon, resEvents.EventIcon);
    XCTAssertEqualObjects(self.theEvents.KeyInfo, resEvents.KeyInfo);
    XCTAssertEqualObjects(self.theEvents.EventName, resEvents.EventName);
    XCTAssertEqualObjects(self.theEvents.BasicsInfo, resEvents.BasicsInfo);
    XCTAssertEqualObjects(self.theEvents.OlympicInfo, resEvents.OlympicInfo);

}
- (void)testBaseDao {
    BaseDAO *baseDao = [[BaseDAO alloc] init];
    XCTAssertEqual([baseDao openDB], true);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
