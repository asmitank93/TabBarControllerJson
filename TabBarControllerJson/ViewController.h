//
//  ViewController.h
//  TabBarControllerJson
//
//  Created by Tops on 1/4/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_nm;
@property (weak, nonatomic) IBOutlet UITextField *txt_year;
- (IBAction)btn_search:(id)sender;

@end

