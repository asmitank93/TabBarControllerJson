//
//  MyTableViewController.h
//  TabBarControllerJson
//
//  Created by Tops on 1/4/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController
{
    NSDictionary *dict;
}
@property(retain,nonatomic)NSString *st_vw_nm;
@property(retain,nonatomic)NSString *st_vw_year;
@end
