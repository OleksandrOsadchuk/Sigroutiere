//
//  UINavTableVC.m
//  SigRoutiere
//
//  Created by Pear on 2016-05-17.
//  Copyright (c) 2016 OsadchukO. All rights reserved.
//

#import "UINavTableVC.h"

@interface UINavTableVC ()

@end

@implementation UINavTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*   doesnt work! // will scroll
     
     int w = self.view.bounds.size.width;
     int h = 100;
   
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    //do something like background color, title, etc you self
    navbar.backgroundColor = UIColor.blueColor;
    
    //[self.navigationController.view addSubview:navbar];
  //  [self.view addSubview:navbar];   //will scroll
  //  [self.tabBarController setTitle:@"tabBarFromSelf"]; //??
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 21;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CGRect frame = tableView.frame;
    

    
    UINavigationBar *nb = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,20,frame.size.width,50)];
  //  UINavigationItem *ni = [UINavigationItem new];
   // UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithTitle:@"buttonItem" style:nil target:nil action:nil];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, frame.size.height+120)];
    //headerView.backgroundColor = [UIColor yellowColor];
    

   // nb.topItem.rightBarButtonItem = bbi;
   // [headerView addSubview:nb];
    
    
    return headerView;
   // nil;
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
