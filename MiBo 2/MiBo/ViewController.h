//
//  ViewController.h
//  MiBo
//
//  Created by Miniwing on 16/8/19.
//  Copyright © 2016年 didown. All rights reserved.
//
#import "LemonKit.h"

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <LKNotificationDelegate>

@property (weak, nonatomic) IBOutlet         UITextField                * NumberTextView;
@property (weak, nonatomic) IBOutlet         UIView                     * TouchView;
@property (weak, nonatomic) IBOutlet         EWPButton                  * sendPraiseBtn;
@end

