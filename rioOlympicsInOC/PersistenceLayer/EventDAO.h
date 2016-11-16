//
//  EventDAO.h
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/14.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "BaseDAO.h"
#import "Events.h"

@interface EventDAO : BaseDAO

- (NSMutableArray*) findAll;
- (Events*)findByKey: (Events*)model;
@end
