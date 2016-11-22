//
//  EventDAO.m
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/14.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "EventDAO.h"

@implementation EventDAO
static EventDAO *sharedSingleton = nil;
+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] init];
    });
    return sharedSingleton;
}

- (NSMutableArray*) findAll {
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        NSString *sql = @"SELECT EventID, EventName, EventIcon, KeyInfo, BasicsInfo, OlympicInfo FROM Events";
        
        //预处理
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                Events *event = [[Events alloc] init];
                //绑定查询到的数据
                event.EventID = sqlite3_column_int(statement, 0);
                
                char *eventName = (char*)sqlite3_column_text(statement, 1);
                event.EventName = [[NSString alloc] initWithUTF8String:eventName];
                
                char *eventIcon = (char*)sqlite3_column_text(statement, 2);
                event.EventIcon = [[NSString alloc] initWithUTF8String:eventIcon];
                
                char *keyInfo = (char*)sqlite3_column_text(statement, 3);
                event.KeyInfo = [[NSString alloc] initWithUTF8String:keyInfo];
                
                char *basicsInfo = (char*)sqlite3_column_text(statement, 4);
                event.BasicsInfo = [[NSString alloc] initWithUTF8String:basicsInfo];
                
                char *olympicInfo = (char*)sqlite3_column_text(statement, 5);
                event.OlympicInfo = [[NSString alloc] initWithUTF8String:olympicInfo];
                
                [listData addObject:event];
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return listData;
}

- (Events*)findByKey: (Events*)model {
    Events *event = [[Events alloc] init];
    
    //打开数据库
    if ([self openDB]) {
        NSString *qsql = @"SELECT EventName, EventIcon, KeyInfo, BasicsInfo, OlympicInfo, EventID FROM Events WHERE EventID = ?";
        //预处理
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
//            NSString* eventID = [[NSString alloc] initWithFormat:@"%i",model.EventID];
//            sqlite3_bind_text(statement, 1, [eventID UTF8String], -1, NULL);
            sqlite3_bind_int(statement, 1, model.EventID);
            if (sqlite3_step(statement) == SQLITE_ROW) {
                char *eventName = (char*)sqlite3_column_text(statement, 0);
                event.EventName = [[NSString alloc] initWithUTF8String:eventName];
                
                char *eventIcon = (char*)sqlite3_column_text(statement, 1);
                event.EventIcon = [[NSString alloc] initWithUTF8String:eventIcon];
                
                char *keyInfo = (char*)sqlite3_column_text(statement, 2);
                event.KeyInfo = [[NSString alloc] initWithUTF8String:keyInfo];
                
                char *basicsInfo = (char*)sqlite3_column_text(statement, 3);
                event.BasicsInfo = [[NSString alloc] initWithUTF8String:basicsInfo];
                
                char *olympicInfo = (char*)sqlite3_column_text(statement, 4);
                event.OlympicInfo = [[NSString alloc] initWithUTF8String:olympicInfo];
                
                event.EventID = sqlite3_column_int(statement, 5);
            }
            sqlite3_finalize(statement);
            sqlite3_close(db);
            return event;
        }

    }
    return nil;
}

@end
