//
//  BaseDAO.h
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/14.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"


@interface BaseDAO : NSObject {
    sqlite3 *db;
}



- (BOOL)openDB;

@end
