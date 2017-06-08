//
//  AddInfosViewController.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "AddInfosViewController.h"
#import "DetailModel.h"

@interface AddInfosViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pointTextField;
@property (weak, nonatomic) IBOutlet UITextField *desTextField;

@end

@implementation AddInfosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //nav
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSave target:self action:@selector(saveItemInfos)];
    self.navigationItem.rightBarButtonItem = rightItem;
    //UI
    self.nameTextField.text  = self.currentModel.usrName;
    self.pointTextField.text = self.currentModel.usrpoint;
    self.desTextField.text   = self.currentModel.contentDesc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)saveItemInfos {
    
    if (!self.nameTextField.text.length && !self.pointTextField.text.length && !self.desTextField.text.length) {
        NSLog(@"需要补全输入框");
        return;
    }
    
    DetailModel *infoModel = [[DetailModel alloc] init];
    infoModel.usrName      = self.nameTextField.text;
    infoModel.contentDesc  = self.desTextField.text;
    infoModel.usrpoint     = self.pointTextField.text;
    
    if (self.currentModel) {
        
        [self.delegate addInfosViewController:self lastModel:self.currentModel updateModel:infoModel];
    }else{
        
        [self.delegate addInfosViewController:self insertModel:infoModel];
    }
}

@end
