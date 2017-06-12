//
//  DocumentDataManger.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "DocumentDataManger.h"
#import "PlistDataManger.h"
#import "ArchiverDataManager.h"
#import "FMDBSQLServices.h"

@implementation DocumentDataManger

+ (NSArray *)loadDocumentData:(LocalDateType)dataType{
    
    NSArray *array = [NSArray new];
    
    switch (dataType) {
        case LocalDateTypePlist:
            array = [PlistDataManger getDocumentPlistArray];
            break;
        case LocalDateTypeArchiver:
            array = [ArchiverDataManager getLocalDocumentData];
            break;
        case LocalDateTypeSQL:
            array = [[FMDBSQLServices shareInstance] getDoucmentArray];
            break;
        default:
            break;
    }
    return array;
}
+ (BOOL)replaceDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array{
    
    switch (dataType) {
        case LocalDateTypePlist:
            return [PlistDataManger updateDocumentPlistArrayWithArr:array];
            break;
        case LocalDateTypeArchiver:
            return [ArchiverDataManager updateLocalDataWithArray:array];
            break;
        default:
            break;
    }    
    return NO;
}
+ (BOOL)insertDocumentDataWithType:(LocalDateType)dataType andModel:(DetailModel *)model{
    
    BOOL isSuccess = NO;
    
    switch (dataType) {
        case LocalDateTypeSQL:
            isSuccess =[[FMDBSQLServices shareInstance] insetSQLDataModel:model];
            break;
            
        default:
            break;
    }
    
    return isSuccess;
}
+ (BOOL)updateDocumentDataWithType:(LocalDateType)dataType andUpModel:(DetailModel *)updateModel{
    BOOL isSuccess = NO;
    
    switch (dataType) {
        case LocalDateTypeSQL:
            isSuccess =[[FMDBSQLServices shareInstance] updateSQLDataWithModel:updateModel];
            break;
        default:
            break;
    }
    
    return isSuccess;
}
+ (BOOL)deleDocumentDateWithType:(LocalDateType)dataType andModel:(DetailModel *)model{
    
    BOOL isSuccess = NO;
    
    switch (dataType) {
        case LocalDateTypeSQL:
            isSuccess =[[FMDBSQLServices shareInstance] delSQLDataWithModel:model];
            break;
        default:
            break;
    }
    
    return isSuccess;
}
@end
