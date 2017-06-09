//
//  DetailModel.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString *usrName;

@property (nonatomic, copy) NSString *usrpoint;

@property (nonatomic, copy) NSString *contentDesc;

+ (NSDictionary *) dicFromModel:(DetailModel *)model;

+ (DetailModel *) modelFromDic:(NSDictionary *)dic;


@end
