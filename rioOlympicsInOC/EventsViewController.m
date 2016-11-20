//
//  EventsViewController.m
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/17.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "EventsViewController.h"
#import "Events.h"
#import "EventBL.h"
#import "EventsViewCell.h"
#import "EventsDetailViewController.h"

@interface EventsViewController ()
@property int columns;
@end

@implementation EventsViewController

static NSString * const reuseIdentifier = @"Cell";
NSMutableArray *events;

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.columns = 2;
    } else {
        self.columns = 5;
    }
    if (events.count == 0 || events == nil) {
        EventBL *bl = [[EventBL alloc] init];
        events = [bl readData];
        [self.collectionView reloadData];
    }
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return events.count / self.columns;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.columns;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EventsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    long index = indexPath.section * self.columns + indexPath.row;
        Events *event = [events objectAtIndex:index];
        cell.imageView.image = [UIImage imageNamed:event.EventIcon];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"ShowDetail"]) {
        NSArray *indexPaths = self.collectionView.indexPathsForSelectedItems;
        NSIndexPath *index = [indexPaths objectAtIndex:0];
        Events *event = [events objectAtIndex: (index.section * self.columns + index.row)];
        EventsDetailViewController *detailVC = segue.destinationViewController;
        detailVC.event = event;
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
