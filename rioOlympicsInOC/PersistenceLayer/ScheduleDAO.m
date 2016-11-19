//
//  ScheduleDAO.m
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/16.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "ScheduleDAO.h"

@implementation ScheduleDAO

- (NSMutableArray*)findAlll {
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        sqlite3_stmt *statement;
        NSString *qsql = @"SELECT ScheduleID, GameDate, GameTime, GameInfo, EventID FROM Schedule";
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Schedule *schedule = [[Schedule alloc] init];
                Events *event = [[Events alloc] init];
                event = schedule.event;
                
                schedule.ScheduleID = sqlite3_column_int(statement, 0);
                
                char *gameDate = (char*)sqlite3_column_text(statement, 1);
                schedule.GameDate = [[NSString alloc] initWithUTF8String:gameDate];
                
                char *gameTime = (char*)sqlite3_column_text(statement, 2);
                schedule.GameTime = [[NSString alloc] initWithUTF8String:gameTime];
                
                char *gameInfo = (char*)sqlite3_column_text(statement, 3);
                schedule.GameInfo = [[NSString alloc] initWithUTF8String:gameInfo];
                
                schedule.event.EventID = sqlite3_column_int(statement, 4);
                
                [listData addObject:event];
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return listData;
}
- (Schedule*)findByKey: (Schedule*)model {
    Schedule *schedule = [[Schedule alloc] init];
    Events *event = [[Events alloc] init];
    event = schedule.event;
    if ([self openDB]) {
        sqlite3_stmt *statement;
        NSString *qsql = @"ScheduleID, GameDate, GameTime, GameInfo, EventID FROM Schedule WHERE ScheduleID = ?";
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            sqlite3_bind_int(statement, 0, model.ScheduleID);
            
            if (sqlite3_step(statement) == SQLITE_OK) {

                
                schedule.ScheduleID = sqlite3_column_int(statement, 0);
                
                char *gameDate = (char*)sqlite3_column_text(statement, 1);
                schedule.GameDate = [[NSString alloc] initWithUTF8String:gameDate];
                
                char *gameTime = (char*)sqlite3_column_text(statement, 2);
                schedule.GameTime = [[NSString alloc] initWithUTF8String:gameTime];
                
                char *gameInfo = (char*)sqlite3_column_text(statement, 3);
                schedule.GameInfo = [[NSString alloc] initWithUTF8String:gameInfo];
                
                schedule.event.EventID = sqlite3_column_int(statement, 4);
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return schedule;
}
@end
