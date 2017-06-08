//
//  DetailInfoCell.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailModel;

@interface DetailInfoCell : UITableViewCell


/**
 *  更新UI
 */
- (void)updateUIWihtDic:(NSDictionary *)dic;

- (void)updateUIWihtModel:(DetailModel *)model;

@end
