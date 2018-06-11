//
//  AppDelegate.m
//  MiBo
//
//  Created by Miniwing on 16/8/19.
//  Copyright © 2016年 didown. All rights reserved.
//

#import "AppDelegate.h"

//#define APP_KEY @"3838050665"
#define APP_KEY @"619586189"

@interface AppDelegate ()<WeiboSDKDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   // Override point for customization after application launch.

   BOOL key = [WeiboSDK registerApp:APP_KEY];
   LogDebug((@"检测是否注册成功==%d",key));
   
#if 0

   ViewController *mainVC = [[ViewController alloc] init];
   
   mainVC.tabBarItem.title = @"main";
   
   mainVC.tabBarItem.image = [UIImage imageNamed:@"main_page_high"];
   
   mainVC.tabBarItem.selectedImage = [UIImage imageNamed:@"main_page"];
   
   UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
   
   SideslipViewController *medicalVC = [[SideslipViewController alloc] init];
   
   medicalVC.tabBarItem.title = @"123456789";
   
   medicalVC.tabBarItem.image = [UIImage imageNamed:@"study"];
   
   medicalVC.tabBarItem.selectedImage = [UIImage imageNamed:@"study_high"];
   
   UINavigationController *rightNav = [[UINavigationController alloc] initWithRootViewController:medicalVC];
   
   SideslipRightViewController *leftVC = [[SideslipRightViewController alloc] init];
   UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:leftVC];
   
   mainVC.tabBarItem.title = @"qwertyu";
   
   mainVC.tabBarItem.image = [UIImage imageNamed:@"main_page_high"];
   
   mainVC.tabBarItem.selectedImage = [UIImage imageNamed:@"main_page"];
   
   
   
   UITabBarController *tabBarControl = [[UITabBarController alloc] init];
   
   tabBarControl.viewControllers = @[mainNav,leftNav,rightNav];
   
   tabBarControl.tabBar.barStyle = UIBarStyleDefault;
   
   tabBarControl.view.backgroundColor = [UIColor whiteColor];
   
   tabBarControl.tabBar.tintColor = [AppDelegate colorFromHexRGB:@"#238E23"]; // 设置高亮颜色
   
   
   
   AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
   
   SideslipViewController *left = [[SideslipViewController alloc] init];
   
   SideslipRightViewController *right = [[SideslipRightViewController alloc] init];
   
   
   RXLSideSlipViewController *RXL = [[RXLSideSlipViewController alloc] initWithContentViewController:tabBarControl leftMenuViewController:left rightMenuViewController:right];
   
   //RXL.backgroundImage = [UIImage imageNamed:@"aaa.png"];
   
   //RXL.delegate = self;
   
   
   RXL.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
   
   RXL.contentViewShadowColor = [UIColor blackColor];
   
   RXL.contentViewShadowOffset = CGSizeMake(0, 0);
   
   RXL.contentViewShadowOpacity = 0.6;
   
   RXL.contentViewShadowRadius = 12;
   
   RXL.contentViewShadowEnabled = NO; // 是否显示阴影
   
   RXL.contentPrefersStatusBarHidden = NO;//是否隐藏主视图的状态条
   
   app.window.rootViewController = RXL;
   
#endif
   
#pragma mark 用ALAssetsLibrary 创建相薄但是这个方法在9.0后不建议使用 可以用photos
   ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
   [library addAssetsGroupAlbumWithName:@"test" resultBlock:^(ALAssetsGroup *group) {
      
      //创建相簿成功
      
   } failureBlock:^(NSError *error) {
      //失败
   }];

   //网络监控句柄
   AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
   //要监控网络连接状态，必须要先调用单例的startMonitoring方法
   [manager startMonitoring];
   
   [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      //status:
      //AFNetworkReachabilityStatusUnknown          = -1,  未知
      //AFNetworkReachabilityStatusNotReachable     = 0,   未连接
      //AFNetworkReachabilityStatusReachableViaWWAN = 1,   3G/4G
      //AFNetworkReachabilityStatusReachableViaWiFi = 2,   无线连接
      NSLog(@"当前的网络状态-----%ld", (long)status);
   }];
   
   return YES;
}


+ (AppDelegate *)shareAppDelegate
{
   return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

//颜色转图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
   CGRect rect = CGRectMake(0, 0, size.width, size.height);
   UIGraphicsBeginImageContext(rect.size);
   CGContextRef context = UIGraphicsGetCurrentContext();
   
   CGContextSetFillColorWithColor(context, [color CGColor]);
   CGContextFillRect(context, rect);
   
   UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   return image;
}

//16进制转颜色
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
   UIColor *result = nil;
   unsigned int colorCode = 0;
   unsigned char redByte, greenByte, blueByte;
   
   if (nil != inColorString)
   {
      NSScanner *scanner = [NSScanner scannerWithString:inColorString];
      (void) [scanner scanHexInt:&colorCode]; // ignore error
   }
   redByte = (unsigned char) (colorCode >> 16);
   greenByte = (unsigned char) (colorCode >> 8);
   blueByte = (unsigned char) (colorCode); // masks off high bits
   result = [UIColor
             colorWithRed: (float)redByte / 0xff
             green: (float)greenByte/ 0xff
             blue: (float)blueByte / 0xff
             alpha:1.0];
   return result;
}



/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request;
{
   LogDebug((@"收到来自微博客户端的回调%@",request.class));
}
/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response{

}


- (void)applicationWillResignActive:(UIApplication *)application {
   // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
   // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
   // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
