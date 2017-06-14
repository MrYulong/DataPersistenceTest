//
//  CoreDataServices.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/14.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailModel;

@interface CoreDataServices : NSObject

+ (instancetype)shareInstance;

- (NSArray *)fetchLocalDataArray;

- (BOOL)addNewItemModel:(DetailModel *)model;

- (BOOL)deleteItemModel:(DetailModel *)model;

- (BOOL)updateItemModel:(DetailModel *)model;

@end
