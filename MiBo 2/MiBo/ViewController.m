//
//  ViewController.m
//  MiBo
//
//  Created by Miniwing on 16/8/19.
//  Copyright © 2016年 didown. All rights reserved.
//

#import "ViewController.h"
#import "LiveRoomTableViewController.h"
#import "SDDemoItemView.h"
#import "MainTableViewController.h"
//#import "MiBo23.h"
#import "SDPieLoopProgressView.h"
#import "SDBallProgressView.h"
#import "TXScrollLabelView.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *demoViews;
@property (nonatomic, strong)    TXScrollLabelView       * scrollLabel;

@end

@implementation ViewController

- (NSMutableArray *)demoViews
{
   if (_demoViews == nil) {
      _demoViews = [NSMutableArray array];
   }
   return _demoViews;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view, typically from a nib.
   
   
   UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
   backbutton.title = @"返回自定义";
   self.navigationItem.backBarButtonItem = backbutton;
   
   
   EWPButton *but = [[EWPButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 120)/2, 10, 120, 55)];
   [but setTitle:@"EWPbutton" forState:UIControlStateNormal];
   [but setImage:[UIImage imageNamed:@"btn_pressed"] forState:UIControlStateNormal];
   [self.view addSubview:but];
   
   but.buttonBlock = ^(id send)
   {
      LogDebug((@"判断是否安装微博客户端%d=====检查用户是否可以通过微博客户端进行分享=%d===== 检查用户是否可以使用微博客户端进行SSO授权=%d",[WeiboSDK isWeiboAppInstalled],[WeiboSDK isCanShareInWeiboAPP],[WeiboSDK isCanSSOInWeiboApp]));
      
      if (![WeiboSDK isWeiboAppInstalled]) {
         NSLog(@"请先安装新浪微博客户端");
         
      }else {
         // 授权页面(授权页面是微博提供的 我们只需要用网页来加载它即可)
         NSLog(@"需要授权");
      }
      
//      LogDebug((@"打开客户端判断%d----微博的安装地址%@",[WeiboSDK openWeiboApp],[WeiboSDK getWeiboAppInstallUrl]));
      
      WBMessageObject *weiboObj = [[WBMessageObject alloc] init];
      weiboObj.text = @"这是一条测试分享的代码";
//      weiboObj.imageObject
      
//      id reWeibo = [WeiboSDK requestWithMessage:weiboObj];
      
//      [self.magasinView setHidden:NO];
//      //创建一个CABasicAnimation对象
//      CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
//      animation.fromValue = @0.5f;
//      animation.toValue = @1.0f;
//      //动画时间
//      animation.duration=0.25f;
//      //是否反转变为原来的属性值
//      //    animation.autoreverses=YES;
//      //把animation添加到图层的layer中，便可以播放动画了。forKey指定要应用此动画的属性
//      [self.magasinView.layer addAnimation:animation forKey:@"scale"];
      
      
   };
   
   
   self.scrollLabel = [TXScrollLabelView scrollWithTitle:@"这是一条测试语句,scrollview滚动        "
                                                    type:TXScrollLabelViewTypeLeftRight
                                                velocity:.7f
                                                 options:UIViewAnimationOptionTransitionFlipFromTop];
   
   self.scrollLabel.backgroundColor = RGBA(22, 102, 249, 0.2);
   
   self.scrollLabel.frame = CGRectMake(120, 200, 190, 22);
   [self.scrollLabel setAutoWidth:YES];
   [self.view addSubview:self.scrollLabel];
   [self.scrollLabel beginScrolling];
   
   [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDPieLoopProgressView class]]];
   [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDBallProgressView class]]];
   // 调整示例frame
   [self setupSubviews];
   
   // 模拟下载进度
   [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressSimulation) userInfo:self repeats:YES];
   
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(__SAVE_PHOTO:)
                                                name:[MainTableViewController SAVE_PHOTP]
                                              object:nil];
   

}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)viewWillDisappear:(BOOL)animated
{

}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)viewDidDisappear:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.

}


- (IBAction)TouchBut:(id)sender {

//   LiveRoomTableViewController *LiveRoomViewController = [[LiveRoomTableViewController alloc] init];
//   [self.navigationController pushViewController:LiveRoomViewController animated:YES];
   
   UIStoryboard *homeStoryboard =
   [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   
   UIViewController *homeView = [homeStoryboard
                                 instantiateViewControllerWithIdentifier:@"MainTableView"];
   
   [self.navigationController pushViewController:homeView animated:YES];
   NSLog(@"This is Test Button sender");
}

- (IBAction)TouchLiveBut:(id)sender
{
   NSLog(@"This is Test Live Button Touch");
}


- (IBAction)Style1:(id)sender
{
   [self getLKNotificationManager].default_style = LK_NOTIFICATION_BAR_STYLE_DARK;
   LKNotificationBar *notificationBar = [[self getLKNotificationManager] createWithTitle: @"这是一个LKNotification" content:@"看这里，这是一个LK Notification Bar，在这里显示的是要提示的正文内容。" icon: [UIImage imageNamed: @"yiguanzhu"]];
   notificationBar.delegate = self;
   [notificationBar showWithAnimated: YES];
}

- (IBAction)Style2:(id)sender
{
   [self showRightWithTitle: @"添加成功" autoCloseTime: 2];
}

- (IBAction)Style3:(id)sender
{
   [self showRoundProgressWithTitle: @"加载中"];
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [self showRightWithTitle: @"加载完毕" autoCloseTime: 2];
   });
}

- (IBAction)Style4:(id)sender
{
   [self showErrorWithTitle: @"下载失败" autoCloseTime: 2];
}

- (IBAction)Style5:(id)sender
{
   LKBubbleInfo *frameInfo = [[LKBubbleInfo alloc] init];
   NSMutableArray<UIImage *> *icons = [[NSMutableArray alloc] init];
   for (int i = 1 ; i <= 8; i ++) {
      [icons addObject: [UIImage imageNamed: [NSString stringWithFormat: @"lkbubble%d.jpg" , i]]];
   }
   frameInfo.iconArray = icons;
   // 在数组中依次放入多张图片即可实现多图循环播放
   frameInfo.backgroundColor = [UIColor colorWithRed: 238 / 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1];
   // 动画的帧动画播放间隔
   frameInfo.frameAnimationTime = 0.15;
   frameInfo.title = @"正在加载中...";
   frameInfo.titleColor = [UIColor darkGrayColor];
   [[LKBubbleView defaultBubbleView] showWithInfo: frameInfo];
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [self showSingleIconBubble: sender];
   });
}
- (IBAction)Style6:(id)sender
{
   [self showSingleIconBubble: sender];
}

- (IBAction)showSingleIconBubble:(UIButton *)sender {
   LKBubbleInfo *iconInfo = [[LKBubbleInfo alloc] init];
   // 把图标数组里面设置只有一张图片即可单图固定图标
   iconInfo.iconArray = @[[UIImage imageNamed: @"lkbubble-warning"]];
   iconInfo.backgroundColor = [UIColor colorWithRed: 0.95 green:0.95 blue:0.95 alpha:1];
   iconInfo.titleColor = [UIColor darkGrayColor];
   iconInfo.locationStyle = BUBBLE_LOCATION_STYLE_BOTTOM;
   iconInfo.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT;
   iconInfo.title = @"这是一个警告的泡泡控件";
   iconInfo.proportionOfDeviation = 0.05;
   iconInfo.bubbleSize = CGSizeMake(300, 60);
   [[LKBubbleView defaultBubbleView] showWithInfo: iconInfo autoCloseTime: 2];
}

-(void)__SAVE_PHOTO:(NSNotification *)sender
{
   [self showRightWithTitle: @"保存成功" autoCloseTime: 2];
}

- (IBAction)TouchView:(UITapGestureRecognizer *)sender {
   NSLog(@"This is Touch view");
   [self praiseAnimation];
   [self.NumberTextView resignFirstResponder];
}


- (IBAction)TouchLikeBut:(id)sender {
   NSLog(@"This is Touch Like Button ");
   NSString * downloadUrl = @"http://180.97.83.132:443/down/eab36d290a96e3e0bcce06412218caf9-15086901/Cornerstone%203.0.1%20MAS%20TNT%20.dmg?cts=f-D61A130A5A146&ctp=61A130A5A146&ctt=1493792900&limit=1&spd=200000&ctk=100cede3cadfd21171eefda89a3bb2d2&chk=eab36d290a96e3e0bcce06412218caf9-15086901";

}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
   if (item.tag == 11) {
      NSLog(@"This is UITabBarItem tag == 11");
     
   }else if (item.tag == 12){
      NSLog(@"This is UITabBarItem tag == 12");
      LiveRoomTableViewController *LiveRoomViewController = [[LiveRoomTableViewController alloc] init];
      [self.navigationController pushViewController:LiveRoomViewController animated:true];
   }
   
}

#pragma mark delegate
- (void)onNavigationBarTouchUpInside:(LKNotificationBar *)navigationBar
{
   NSLog(@"TOUCH !@");
   [navigationBar hideWithAnimated: YES];
}

- (void)setupSubviews
{
   NSUInteger perrowCount= 2;
   CGFloat w = 80;
   CGFloat h = w;
   CGFloat margin = (self.view.frame.size.width - perrowCount * w) / (perrowCount + 1);
   [self.demoViews enumerateObjectsUsingBlock:^(SDDemoItemView *demoView, NSUInteger idx, BOOL *stop) {
      NSUInteger rowIndex = idx / perrowCount;
      NSUInteger columnIndex = idx % perrowCount;
      CGFloat x = margin + (w + margin) * columnIndex;
      CGFloat y = margin + (h + margin) * rowIndex;
      demoView.frame = CGRectMake(x, y, w, h);
//      demoView.backgroundColor = [UIColor redColor];
      [self.view addSubview:demoView];
   }];
}

- (void)progressSimulation
{
   static CGFloat progress = 0;
   
   if (progress < 1.0) {
      progress += 0.01;
      
      // 循环
      if (progress >= 1.0) progress = 0;
      
      [self.demoViews enumerateObjectsUsingBlock:^(SDDemoItemView *demoView, NSUInteger idx, BOOL *stop) {
         demoView.progressView.progress = progress;
      }];
   }
}


#pragma mark - 点赞动画
- (void)praiseAnimation
{
   
   static int tagNumber = 500000;
   tagNumber ++;
   
   UIImageView *imageView = [[UIImageView alloc] initWithImage:
                             [UIImage imageNamed:
                              [self randomHeartImageName]]];
   
   imageView.center = CGPointMake(-5000, -5000);
   imageView.tag = tagNumber;
   //    imageView.alpha = (arc4random() % (60 + 1) + 40) / 100.0f;
   [self.view addSubview:imageView];
   // 设定为缩放
   CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
   
   // 动画选项设定
   animation.duration = 0.5f; // 动画持续时间
   //    animation.autoreverses = NO; // 动画结束时执行逆动画
   animation.removedOnCompletion=NO;
   
   // 缩放倍数
   animation.fromValue = [NSNumber numberWithFloat:0.1]; // 开始时的倍率
   animation.toValue = [NSNumber numberWithFloat:1.0]; // 结束时的倍率
   
   CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
   keyAnima.keyPath=@"position";
   
   //1.1告诉系统要执行什么动画
   //创建一条路径
   CGMutablePathRef path=CGPathCreateMutable();
   
   //设置一个圆的路径
   //    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
   CGPathMoveToPoint(path, NULL, self.sendPraiseBtn.center.x, self.sendPraiseBtn.center.y);
   int controlX = (arc4random() % (100 + 1)) - 50;
   int controlY = (arc4random() % (130 + 1)) + 50;
   int entX = (arc4random() % (100 + 1)) - 50;
   //位置
   CGPathAddQuadCurveToPoint(path, NULL, self.sendPraiseBtn.center.x - controlX, self.sendPraiseBtn.center.y - controlY, self.sendPraiseBtn.center.x + entX, self.sendPraiseBtn.center.y - 450);
   
   keyAnima.path=path;
   //有create就一定要有release
   CGPathRelease(path);
   //1.2设置动画执行完毕后，不删除动画
   keyAnima.removedOnCompletion=NO;
   //1.3设置保存动画的最新状态
   keyAnima.fillMode=kCAFillModeForwards;
   //1.4设置动画执行的时间
   keyAnima.duration=2.0;
   //1.5设置动画的节奏
   keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
   
   CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
   
   // 动画选项设定
   alphaAnimation.duration = 1.5f; // 动画持续时间
   alphaAnimation.removedOnCompletion=NO;
   
   alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
   alphaAnimation.toValue = [NSNumber numberWithFloat:0.1f];
   alphaAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
   alphaAnimation.beginTime = 0.5f;
   
   CAAnimationGroup *group = [CAAnimationGroup animation];
   
   // 动画选项设定
   group.duration = 2.0;
   group.repeatCount = 1;
   group.animations = [NSArray arrayWithObjects:animation, keyAnima, alphaAnimation, nil];
   group.delegate = self;
   
   [group setValue:[NSNumber numberWithInteger:tagNumber] forKey:@"animationName"];
   
   [imageView.layer addAnimation:group forKey:@"wendingding"];
}

- (NSString *)randomHeartImageName
{
   NSInteger number = arc4random() % (4 + 1);
   NSString *randomImageName;
   switch (number) {
      case 1:
         randomImageName = @"bHeart";
         break;
      case 2:
         randomImageName = @"gHeart";
         break;
      case 3:
         randomImageName = @"rHeart";
         break;
      case 4:
         randomImageName = @"yHeart";
         break;
      default:
         randomImageName = @"bHeart";
         break;
   }
   return randomImageName;
}


@end
