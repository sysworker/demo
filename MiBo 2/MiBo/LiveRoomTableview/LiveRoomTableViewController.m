//
//  LiveRoomTableViewController.m
//  MiBo
//
//  Created by Miniwing on 16/8/31.
//  Copyright © 2016年 didown. All rights reserved.
//

#import "LiveRoomTableViewController.h"
#import "LiveRoomTableViewCell.h"
@interface LiveRoomTableViewController ()

@end

@implementation LiveRoomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
   self.title = @"活动列表展示";
   _rewards = [NSMutableArray arrayWithObjects:@"美国", @"菲律宾",
               @"黄岩岛", @"中国", @"泰国", @"越南", @"老挝",
               @"日本" , @"美国", @"菲律宾",
               @"黄岩岛", @"中国", @"泰国", @"越南", @"老挝",
               @"日本" ,@"美国", @"菲律宾",
               @"黄岩岛", @"中国", @"泰国", @"越南", @"老挝",
               @"日本" ,nil];

   [self.LiveRoomTableView registerNib:
                 [UINib nibWithNibName:@"LiveRoomTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"cell"];
   NSLog(@"LiveRoomTableViewController == viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
       return [_rewards count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
   
    LiveRoomTableViewCell *LiveRoomTableViewCell   = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   NSUInteger row = [indexPath row];
   [LiveRoomTableViewCell.HeadImageView setImage:[UIImage imageNamed:@"money"]];
   LiveRoomTableViewCell.ContentLabel.text = [_rewards objectAtIndex:row];

    return LiveRoomTableViewCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return @"删除";
}
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
