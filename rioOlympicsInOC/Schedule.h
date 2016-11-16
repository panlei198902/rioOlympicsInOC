//
//  Schedule.h
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/13.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"

@interface Schedule : NSObject
@property int ScheduleID;
@property NSString *GameDate;
@property NSString *GameTime;
@property NSString *GameInfo;
@property Events *event;
@end
