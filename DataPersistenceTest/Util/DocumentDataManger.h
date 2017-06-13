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

/**
 更新本地数组或者更新单个model
 
 @param dataType 本地存储类型
 @param array 需要整体更新
 @param index 更新的index
 @param updateModel 更新的model
 @return 更新之后的数组 nil表示更新失败
 */
+ (NSArray *)updateTheDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array selectIndex:(NSInteger)index andUpModel:(DetailModel *)updateModel;

/**
 替换本地数组或者删除单个model

 @param dataType 本地存储类型
 @param array 需要整体更新
 @param updateModel 更新的model
 @return 是否成功
 */
+ (BOOL)deleTheDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array andUpModel:(DetailModel *)updateModel;

/**
 替换本地数组或者插入单个model
 
 @param dataType 本地存储类型
 @param array 需要整体更新
 @param updateModel 更新的model
 @return 是否成功
 */
+ (BOOL)insertTheDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array andUpModel:(DetailModel *)updateModel;



@end
