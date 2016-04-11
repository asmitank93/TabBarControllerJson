//
//  ViewController.m
//  TabBarControllerJson
//
//  Created by Tops on 1/4/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txt_nm,txt_year;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_search:(id)sender
{
    MyTableViewController *mytbl=[self.storyboard instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    mytbl.st_vw_nm=txt_nm.text;
    mytbl.st_vw_year=txt_year.text;
    [self.navigationController pushViewController:mytbl animated:YES];
}
@end
