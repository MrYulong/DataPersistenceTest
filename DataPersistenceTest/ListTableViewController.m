//
//  ListTableViewController.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "ListTableViewController.h"
#import "DetailViewController.h"

@interface ListTableViewController ()<UITableViewDelegate>

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard * main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailVC = [main instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailVC.currentDataType = indexPath.row;
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
