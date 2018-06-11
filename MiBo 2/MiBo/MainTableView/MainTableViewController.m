//
//  MainTableViewController.m
//  MiBo
//
//  Created by Miniwing on 16/8/31.
//  Copyright © 2016年 didown. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"

@interface MainTableViewController ()
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
   self.title = @"主播列表";
   
   NSLog(@"MainTableViewContoller == viewDidLoad");
   
   _StarRewards = [NSMutableArray arrayWithObjects:@"VU铭门丶叶止", @"XR丶月轩",
               @"XR-叶晨", @"XR-纸巾", @"VU铭门丶笑笑", @"VU铭门丶小阳", @"[美秀]笑笑",
               @"VU铭门丶柠檬" ,@"豪门丶[美秀]肉多多",@"豪门丶[美秀]夏安安",@"JHT兔小团", nil];
   
   _StarHeadImg = [NSMutableArray arrayWithObjects:
               @"http://head.youximao.tv/50679220-6650-4301-80f6-c6ab15c61ab6.jpg?imageView2/1/w/400/h/400/interlace/1",
               @"http://pic.51rebo.cn/upload/avatar/20160907/05265761697886369.png",
               @"http://pic.51rebo.cn/upload/avatar/20160908/05266427886707334.png",
               @"http://pic.51rebo.cn/upload/avatar/20160820/05250487196735384.png",
               @"http://pic.51rebo.cn/upload/avatar/20160906/05265033887662960.png",
               @"http://img.youximao.cn/207183_1468397630939?imageView2/1/w/400/h/400/interlace/1",
               @"http://img.youximao.tv/31202_1472810424050?imageView2/1/w/400/h/400/interlace/1",
               @"http://img.youximao.tv/208082_14664813133503?imageView2/1/w/400/h/400/interlace/1",
               @"http://img.youximao.tv/208864_1472710096369?imageView2/1/w/400/h/400/interlace/1",
               @"http://img.youximao.tv/211288_1473053403047?imageView2/1/w/400/h/400/interlace/1",
               @"http://img.youximao.tv/33067_1462388319580?imageView2/1/w/400/h/400/interlace/1",
               nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{

}

-(void)viewDidAppear:(BOOL)animated
{

}

-(void)viewWillDisappear:(BOOL)animated
{

}

-(void)viewDidDisappear:(BOOL)animated
{

}
/*   
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return  170.0F;
 };
 */
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [_StarRewards count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   //hendimg size （375，270）
   MainTableViewCell *resultCell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"some"];
   NSUInteger row = [indexPath row];
   resultCell.T_Message_Label.text = [_StarRewards objectAtIndex:row];
   resultCell.T_Message_Label.font = [UIFont boldSystemFontOfSize:18.0f];
   resultCell.T_Message_Label.textColor = [UIColor whiteColor];
   resultCell.T_Message_Label.shadowOffset = CGSizeMake(0.1f, 0.1f);
   resultCell.T_Message_Label.shadowColor =SDColorMaker(131, 231, 231, 0.7);
   resultCell.StarHeadImg.yy_imageURL = [NSURL URLWithString:[_StarHeadImg objectAtIndex:row]];

   return resultCell;
}

- (IBAction)StarInfoBut:(id)sender forEvent:(UIEvent *)event
{
   NSSet *touches =[event allTouches];
   UITouch *touch =[touches anyObject];
   CGPoint currentTouchPosition = [touch locationInView:self.LiveTab];
   NSIndexPath *indexPath= [self.LiveTab indexPathForRowAtPoint:currentTouchPosition];
   if (indexPath!= nil)
   {
      MainTableViewCell        *cell = [self.LiveTab cellForRowAtIndexPath:indexPath];
      NSLog(@"Cell.starName=====%ld=====%@",(long)indexPath.row,cell.T_Message_Label.text);
      self.StarImg = cell.StarHeadImg.image;
      
      [self createAlbum];
      [[NSNotificationCenter defaultCenter] postNotificationName:[MainTableViewController SAVE_PHOTP] object:nil];
      // do something
   }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"didSelectRowAtIndexPath=======%ld",(long)indexPath.row);
   return ;
}

+ (NSString *)SAVE_PHOTP
{
   return @"SAVE_PHOTO";
}

#pragma mark - 创建相册
- (void)createAlbum
{
   ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
   NSMutableArray *groups=[[NSMutableArray alloc]init];
   ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop)
   {
      if (group)
      {
         [groups addObject:group];
      }
      
      else
      {
         BOOL haveHDRGroup = NO;
         
         for (ALAssetsGroup *gp in groups)
         {
            NSString *name =[gp valueForProperty:ALAssetsGroupPropertyName];
            
            if ([name isEqualToString:@"MiBoPhotos"])
            {
               haveHDRGroup = YES;
            }
         }
         
         if (!haveHDRGroup)
         {
            //do add a group named "XXXX"
            [assetsLibrary addAssetsGroupAlbumWithName:@"MiBoPhotos"
                                           resultBlock:^(ALAssetsGroup *group)
             {
                [groups addObject:group];
                
             }
                                          failureBlock:nil];
            haveHDRGroup = YES;
         }
      }
      
   };
   //创建相簿
   [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:listGroupBlock failureBlock:nil];
   
   [self saveToAlbumWithMetadata:nil imageData:UIImagePNGRepresentation(self.StarImg) customAlbumName:@"MiBoPhotos" completionBlock:^
    {
       //这里可以创建添加成功的方法
       
    }
                    failureBlock:^(NSError *error)
    {
       //处理添加失败的方法显示alert让它回到主线程执行，不然那个框框死活不肯弹出来
       dispatch_async(dispatch_get_main_queue(), ^{
          
          //添加失败一般是由用户不允许应用访问相册造成的，这边可以取出这种情况加以判断一下
          if([error.localizedDescription rangeOfString:@"User denied access"].location != NSNotFound ||[error.localizedDescription rangeOfString:@"用户拒绝访问"].location!=NSNotFound){
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:error.localizedDescription message:error.localizedFailureReason delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", nil) otherButtonTitles: nil];
             
             [alert show];
          }
       });
    }];
}

- (void)saveToAlbumWithMetadata:(NSDictionary *)metadata
                      imageData:(NSData *)imageData
                customAlbumName:(NSString *)customAlbumName
                completionBlock:(void (^)(void))completionBlock
                   failureBlock:(void (^)(NSError *error))failureBlock
{
   
   ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
   __weak ALAssetsLibrary *weakSelf = assetsLibrary;
   void (^AddAsset)(ALAssetsLibrary *, NSURL *) = ^(ALAssetsLibrary *assetsLibrary, NSURL *assetURL) {
      [assetsLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset) {
         [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            
            if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:customAlbumName]) {
               [group addAsset:asset];
               if (completionBlock) {
                  completionBlock();
               }
            }
         } failureBlock:^(NSError *error) {
            if (failureBlock) {
               failureBlock(error);
            }
         }];
      } failureBlock:^(NSError *error) {
         if (failureBlock) {
            failureBlock(error);
         }
      }];
   };
   [assetsLibrary writeImageDataToSavedPhotosAlbum:imageData metadata:metadata completionBlock:^(NSURL *assetURL, NSError *error) {
      if (customAlbumName) {
         [assetsLibrary addAssetsGroupAlbumWithName:customAlbumName resultBlock:^(ALAssetsGroup *group) {
            if (group) {
               [weakSelf assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                  [group addAsset:asset];
                  if (completionBlock) {
                     completionBlock();
                  }
               } failureBlock:^(NSError *error) {
                  if (failureBlock) {
                     failureBlock(error);
                  }
               }];
            } else {
               AddAsset(weakSelf, assetURL);
            }
         } failureBlock:^(NSError *error) {
            AddAsset(weakSelf, assetURL);
         }];
      } else {
         if (completionBlock) {
            completionBlock();
         }
      }
   }];
}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//   return UIInterfaceOrientationMaskPortrait;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//   return UIInterfaceOrientationPortrait;
//}

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
