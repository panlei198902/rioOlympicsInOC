//
//  ScheduleViewController.m
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/20.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleBL.h"
#import "Schedule.h"
@interface ScheduleViewController ()

@property NSMutableDictionary* schedules;
@property NSArray* arrayGameList;
@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.schedules == nil || self.schedules.count == 0) {
        ScheduleBL* bl = [[ScheduleBL alloc] init];
        self.schedules = [bl readData];
        
        NSArray* keys = [self.schedules allKeys];
        self.arrayGameList = [keys sortedArrayUsingSelector:@selector(compare:)];
    }

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.schedules.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString* gameDateList = self.arrayGameList[section];
    NSArray *schedulesInSection = self.schedules[gameDateList];
    return schedulesInSection.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString* sectionTitle = self.arrayGameList[section];
    return sectionTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchedulesCell" forIndexPath:indexPath];
    NSString* gameDataTitle = self.arrayGameList[indexPath.section];
    NSArray* schedulesInSection = self.schedules[gameDataTitle];
    Schedule *schedule = schedulesInSection[indexPath.row];
    NSString* subtitle = [[NSString alloc] initWithFormat:@"%@ | %@", schedule.GameInfo, schedule.event.EventName];
    cell.textLabel.text = subtitle;
     /*
      let strGameData = self.arrayGameDateList[indexPath.section] as! NSString
      let schedules = self.data.object(forKey: strGameData) as! NSArray
      let schedule = schedules.object(at: indexPath.row) as! Schedule
      let subtitle = NSString(format: "%@ | %@", schedule.GameInfo!,schedule.Event!.EventName!)
      cell.detailTextLabel?.text = subtitle as String
      cell.textLabel?.text = schedule.GameDate as String?
      */
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
