//
//  ScheduleBL.m
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/20.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "ScheduleBL.h"
#import "ScheduleDAO.h"
#import "EventDAO.h"

@implementation ScheduleBL
- (NSMutableDictionary*)readData {
    //创建ScheduleDAO实例
    ScheduleDAO *scheduleDAO = [ScheduleDAO sharedInstance];
    //创建EventDAO实例
    EventDAO* eventDAO = [EventDAO sharedInstance];
    NSMutableArray *schedules = [scheduleDAO findAll];
    NSMutableDictionary* resDict = [[NSMutableDictionary alloc] init];
    
    for (Schedule* item in schedules) {
        Schedule* schedule = item;
        Events* event = [[Events alloc] init];
        event = [eventDAO findByKey:schedule.event];
        schedule.event = event;
        
        NSArray* key = resDict.allKeys;
        if ([key containsObject:schedule.GameDate]) {
            NSMutableArray* values = [resDict objectForKey:schedule.GameDate];
            [values addObject:schedule];
        }   else {
            NSMutableArray* values = [[NSMutableArray alloc] init];
            [values addObject:schedule];
            [resDict setObject:values forKey:schedule.GameDate];
        }
        
    }
    
    
    return resDict;
}

@end
