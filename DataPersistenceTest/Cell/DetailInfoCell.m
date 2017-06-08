//
//  DetailInfoCell.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "DetailInfoCell.h"
#import "DetailModel.h"


@interface DetailInfoCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *pointLab;

@property (weak, nonatomic) IBOutlet UILabel *desLab;

@end


@implementation DetailInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateUIWihtDic:(NSDictionary *)dic{

    DetailModel *model = [DetailModel new];
    [model setValuesForKeysWithDictionary:dic];
    [self updateUIWihtModel:model];
    
}
- (void)updateUIWihtModel:(DetailModel *)model{
    
    self.nameLab.text  = model.usrName;
    self.pointLab.text = model.usrpoint;
    self.desLab.text  = model.contentDesc;
}


@end
