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
#import "DetailModel.h"
#import "CoreDataServices.h"

@implementation DocumentDataManger

#pragma mark -
#pragma mark public
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
        case LocalDateTypeCoreData:
            array = [[CoreDataServices shareInstance] fetchLocalDataArray];
            break;
        default:
            break;
    }
    return array;
}

+ (NSArray *)updateTheDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array selectIndex:(NSInteger)index andUpModel:(DetailModel *)updateModel{
    
    BOOL isSuccess = false;
    NSMutableArray *mubarray = [NSMutableArray arrayWithArray:array];

    if (dataType == LocalDateTypePlist || dataType == LocalDateTypeArchiver) {
        
        [mubarray replaceObjectAtIndex:index withObject:dataType == LocalDateTypePlist?[DetailModel dicFromModel:updateModel]:updateModel];
        isSuccess = [DocumentDataManger replaceDocumentDataWithType:dataType andArray:[array copy]];
        
    }else {
        
        isSuccess = [DocumentDataManger updateDocumentDataWithType:dataType andUpModel:updateModel];
        
        [mubarray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            DetailModel *detail = obj;
            if (detail.usrID == updateModel.usrID) {
                
                [mubarray replaceObjectAtIndex:idx withObject:updateModel];
                *stop = YES;
            }
        }];
    }
    if (!isSuccess) {
        return nil;
    }
    return mubarray;
}

+ (BOOL)deleTheDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array andUpModel:(DetailModel *)updateModel{
    
    BOOL isSuccess = false;
    if (dataType == LocalDateTypePlist || dataType == LocalDateTypeArchiver) {
        
        isSuccess = [DocumentDataManger replaceDocumentDataWithType:dataType andArray:[array copy]];
    }else{
        
        isSuccess = [DocumentDataManger deleDocumentDateWithType:dataType andModel:updateModel];
    }

    return isSuccess;
    
}
+ (BOOL)insertTheDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array andUpModel:(DetailModel *)updateModel{
 
    BOOL isSuccess = false;
    if (dataType == LocalDateTypePlist || dataType == LocalDateTypeArchiver) {
        
        isSuccess = [DocumentDataManger replaceDocumentDataWithType:dataType andArray:[array copy]];
    }else{
        
        isSuccess = [DocumentDataManger insertDocumentDataWithType:dataType andModel:updateModel];
    }
    return isSuccess;
}




#pragma mark -
#pragma mark privite

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
        case LocalDateTypeCoreData:
            isSuccess = [[CoreDataServices shareInstance] addNewItemModel:model];
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
        case LocalDateTypeCoreData:
            isSuccess = [[CoreDataServices shareInstance] updateItemModel:updateModel];
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
        case LocalDateTypeCoreData:
            isSuccess =[[CoreDataServices shareInstance] deleteItemModel:model];
            break;
        default:
            break;
    }
    
    return isSuccess;
}
@end
