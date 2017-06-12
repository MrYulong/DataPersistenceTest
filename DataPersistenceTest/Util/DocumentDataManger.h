//
//  DocumentDataManger.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailModel;

typedef NS_ENUM(NSUInteger, LocalDateType) {
    LocalDateTypePlist             = 0,
    LocalDateTypeArchiver,
    LocalDateTypeSQL,
    LocalDateTypeCoreData
};


@interface DocumentDataManger : NSObject

//查
+ (NSArray *)loadDocumentData:(LocalDateType)dataType;
//增
+ (BOOL)insertDocumentDataWithType:(LocalDateType)dataType andModel:(DetailModel *)model;
//改
+ (BOOL)updateDocumentDataWithType:(LocalDateType)dataType andUpModel:(DetailModel *)updateModel;
///更新替换本地存储
+ (BOOL)replaceDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array;
//删
+ (BOOL)deleDocumentDateWithType:(LocalDateType)dataType andModel:(DetailModel *)model;



@end
