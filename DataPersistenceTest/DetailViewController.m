//
//  DetailViewController.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailInfoCell.h"
#import "AddInfosViewController.h"
#import "DocumentDataManger.h"
#import "DetailModel.h"

@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource, AddInfosViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [DocumentDataManger loadDocumentData:self.currentDataType];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(addItemInfos)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark -
#pragma mark ACTION
- (void)addItemInfos{
    
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddInfosViewController *addInfoVC = [storybord instantiateViewControllerWithIdentifier:@"AddInfosViewController"];
    addInfoVC.delegate = self;
    [self.navigationController pushViewController:addInfoVC animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell= [[[NSBundle mainBundle]loadNibNamed:@"DetailInfoCell" owner:nil options:nil] firstObject];        
    }
    if (self.currentDataType == LocalDateTypePlist) {
        
        NSDictionary *dic = self.dataArray[indexPath.row];
        [cell updateUIWihtDic:dic];
    }else{
        
        DetailModel *model = self.dataArray[indexPath.row];
        [cell updateUIWihtModel:model];
    }
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddInfosViewController *addInfoVC = [storybord instantiateViewControllerWithIdentifier:@"AddInfosViewController"];
    addInfoVC.delegate = self;
    if (self.currentDataType == LocalDateTypePlist) {
        
        addInfoVC.currentModel = [DetailModel modelFromDic:self.dataArray[indexPath.row]];
    }else{
        addInfoVC.currentModel = self.dataArray[indexPath.row];
    }
    addInfoVC.selectIndex = indexPath.row;
    [self.navigationController pushViewController:addInfoVC animated:YES];

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.dataArray];
    [array removeObjectAtIndex:indexPath.row];
    
    BOOL isSuccess = [DocumentDataManger deleTheDocumentDataWithType:self.currentDataType andArray:array andUpModel:self.dataArray[indexPath.row]];
    if (isSuccess) {
        [self updateUIWithArray:array];
    }
}
- (void)updateUIWithArray:(NSArray *)array{
    
    self.dataArray = [array copy];
    [self.tableview reloadData];
    NSLog(@"数据保存成功");
}

#pragma mark -
#pragma mark AddInfosViewControllerDelegate
//更新DetailModel
- (BOOL)addInfosViewController:(AddInfosViewController *)viewController selectIndex:(NSInteger)index updateModel:(DetailModel *)upModel{
    
    NSArray *array = [DocumentDataManger updateTheDocumentDataWithType:self.currentDataType andArray:self.dataArray selectIndex:index andUpModel:upModel];
    
    if (array) {
        [self updateUIWithArray:array];
    }
    return array?YES:NO;
}
//保存新的DetailModel
- (BOOL)addInfosViewController:(AddInfosViewController *)viewController  insertModel:(DetailModel *)inModel{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.dataArray];
    if (self.currentDataType == LocalDateTypePlist) {
        
        [array addObject:[DetailModel dicFromModel:inModel]];

    }else{
        [array addObject:inModel];
    }
    
    BOOL isSuccess = [DocumentDataManger insertTheDocumentDataWithType:self.currentDataType andArray:array andUpModel:inModel];
    if (isSuccess) {
        [self updateUIWithArray:array];
    }
    return isSuccess;
}

@end
