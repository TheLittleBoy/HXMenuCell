//
//  TableViewController.m
//  HXMenuCell
//
//  Created by  MAC on 15/2/13.
//  Copyright (c) 2015年 华夏大地教育. All rights reserved.
//

#import "TableViewController.h"
#import "HXTableViewCell.h"

@interface TableViewController ()
{
    NSMutableArray * dataSource;
    BOOL showMenu;
    NSIndexPath * path;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    
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

    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = dataSource[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (!showMenu) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    showMenu = NO;
}

#pragma mark - 三个系统代理必须全部实现！

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    showMenu = YES;
    path = indexPath;
    
    //cell中需要重写canBecomeFirstResponder
    HXTableViewCell * cell = (HXTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    //需要成为第一响应者
    [cell becomeFirstResponder];
    
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    //这里的frame影响箭头的位置
    CGRect rect = cell.frame;
    rect.size.width= 200;
    [menu setTargetRect:rect inView:tableView];
    
    //添加你要自定义的MenuItem
    UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"复制"
                                                  action:@selector(copyMenuPress:)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"删除"
                                                   action:@selector(delMenuPress:)];
    UIMenuItem *item3 = [[UIMenuItem alloc] initWithTitle:@"编辑"
                                                   action:@selector(copyMenuPress:)];
    UIMenuItem *item4 = [[UIMenuItem alloc] initWithTitle:@"转发"
                                                   action:@selector(copyMenuPress:)];
    UIMenuItem *item5 = [[UIMenuItem alloc] initWithTitle:@"分享分享"
                                                   action:@selector(copyMenuPress:)];
    menu.menuItems = [NSArray arrayWithObjects:item,item2,item3,item4,item5,nil];
    
    [menu setMenuVisible:YES animated:YES];
    
    //return YES or NO 都可以
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {

    //屏蔽掉系统的copy:等其它函数
    return NO;
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    
    //这里只会调用系统的SEL
    if (action == @selector(copy:)) {
        
       // [UIPasteboard generalPasteboard].string = [data objectAtIndex:indexPath.row];
    }
}


#pragma mark - menu method

/**
 *  @author wangxuanao
 *
 *  menu响应方法  复制
 *
 *  @param menu
 */
-(void)copyMenuPress:(UIMenuController *)menu
{
    
    UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:path];
    
    [dataSource addObject:cell.textLabel.text];
    
    [self.tableView reloadData];
    
}

/**
 *  @author wangxuanao
 *
 *  menu响应方法  删除
 *
 *  @param menu
 */
-(void)delMenuPress:(UIMenuController *)menu
{
    
    [dataSource removeObjectAtIndex:path.row];
    
    [self.tableView reloadData];
    
}

@end
