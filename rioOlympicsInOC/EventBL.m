//
//  EventBL.m
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/17.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "EventBL.h"
#import "EventDAO.h"
#import "BaseDAO.h"
@implementation EventBL

- (NSMutableArray*)readData {
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    EventDAO *dao = [EventDAO sharedInstance];
    [dao findAll];
    return listData;
}
@end
