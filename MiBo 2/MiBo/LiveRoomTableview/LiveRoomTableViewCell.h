//
//  LiveRoomTableViewCell.h
//  MiBo
//
//  Created by Miniwing on 16/8/31.
//  Copyright © 2016年 didown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveRoomTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UITableViewCell *customCell;

@property (weak, nonatomic) IBOutlet UIImageView *HeadImageView;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;
@end
