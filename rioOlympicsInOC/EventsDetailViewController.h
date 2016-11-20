//
//  EventsDetailViewController.h
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/20.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface EventsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *EventName;
@property (weak, nonatomic) IBOutlet UITextView *keyInfo;
@property (weak, nonatomic) IBOutlet UITextView *basicscsInfo;
@property (weak, nonatomic) IBOutlet UITextView *OlympicInfo;
@property Events* event;

@end
