//
//  MainTableViewCell.h
//  MiBo
//
//  Created by Miniwing on 16/8/29.
//  Copyright © 2016年 didown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic)         IBOutlet             UILabel                 * T_Message_Label;
@property (nonatomic,assign)                             NSString                * MessageSTR;
@property (weak, nonatomic)         IBOutlet             UIImageView             * StarHeadImg;

@property (weak, nonatomic)         IBOutlet             UIButton                * StarPhotosBut;
@end
