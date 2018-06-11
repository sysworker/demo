//
//  LiveRoomTableViewController.h
//  MiBo
//
//  Created by Miniwing on 16/8/31.
//  Copyright © 2016年 didown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveRoomTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableView *LiveRoomTableView;

@property (nonatomic,strong) NSMutableArray *rewards;

@end
