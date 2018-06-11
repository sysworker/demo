//
//  MainTableViewController.h
//  MiBo
//
//  Created by Miniwing on 16/8/31.
//  Copyright © 2016年 didown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController
@property (weak, nonatomic)            IBOutlet        UITableView                *  LiveTab;

@property (nonatomic,strong)                             NSMutableArray             *  StarRewards;
@property (nonatomic,strong)                             NSMutableArray             *  StarHeadImg;

@property (nonatomic,strong)                             UIImage                    *  StarImg;

+ (NSString *)SAVE_PHOTP;
@end
