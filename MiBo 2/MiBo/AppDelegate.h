//
//  AppDelegate.h
//  MiBo
//
//  Created by Miniwing on 16/8/19.
//  Copyright © 2016年 didown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end

