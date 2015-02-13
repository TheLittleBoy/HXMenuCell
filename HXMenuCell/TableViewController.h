//
//  TableViewController.h
//  HXMenuCell
//
//  Created by  MAC on 15/2/13.
//  Copyright (c) 2015年 华夏大地教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
