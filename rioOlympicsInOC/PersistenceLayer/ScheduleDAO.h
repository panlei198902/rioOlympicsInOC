//
//  ScheduleDAO.h
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/16.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "BaseDAO.h"
#import "Schedule.h"
#import "Events.h"
@interface ScheduleDAO : BaseDAO

+ (instancetype)sharedInstance;
- (NSMutableArray*)findAll;
- (Schedule*)findByKey: (Schedule*)model;

@end
