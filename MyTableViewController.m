//
//  MyTableViewController.m
//  TabBarControllerJson
//
//  Created by Tops on 1/4/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController
@synthesize st_vw_nm,st_vw_year;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *query=@"";
    if (st_vw_year.length>0)
    {
        query=[NSString stringWithFormat:@"http://www.omdbapi.com/?t=%@&y=%@&plot=full&r=json",[st_vw_nm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],st_vw_year];
    }
    else
    {
        query=[NSString stringWithFormat:@"http://www.omdbapi.com/?t=%@&y=&plot=full&r=json",[st_vw_nm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    dict=[[NSDictionary alloc]init];
    //NSLog(@"%@",query);
    NSURL *url=[NSURL URLWithString:query];
    //NSLog(@"%@",url);
    NSData *data=[NSData dataWithContentsOfURL:url];
    dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return dict.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if ([[[dict allKeys]objectAtIndex:indexPath.row]isEqual:@"Poster"])
    {
        NSURL *url_get=[NSURL URLWithString:[[dict allValues]objectAtIndex:indexPath.row]];
        NSData *data=[NSData dataWithContentsOfURL:url_get];
        cell.imageView.image=[UIImage imageWithData:data];
        
        cell.detailTextLabel.text=[[dict allKeys]objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text=[[dict allValues]objectAtIndex:indexPath.row];
        cell.detailTextLabel.text=[[dict allKeys]objectAtIndex:indexPath.row];
    }
    
    // Configure the cell...
    
    return cell;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
