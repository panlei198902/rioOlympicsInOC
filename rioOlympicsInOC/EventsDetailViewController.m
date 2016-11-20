//
//  EventsDetailViewController.m
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/20.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "EventsDetailViewController.h"

@interface EventsDetailViewController ()

@end

@implementation EventsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.EventName.text = self.event.EventName;
    self.imageView.image = [UIImage imageNamed:self.event.EventIcon];
    self.keyInfo.text = self.event.KeyInfo;
    self.basicscsInfo.text = self.event.BasicsInfo;
    self.OlympicInfo.text = self.event.OlympicInfo;
    
    //CGSizeMake(self.view.frame.size.width, 1000);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
