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
        default:
            break;
    }
    return array;
}
+ (BOOL)replaceDocumentDataWithType:(LocalDateType)dataType andArray:(NSArray *)array{
    
    if (dataType == LocalDateTypePlist) {
        
    }
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
    
    
    
    return NO;
}
+ (BOOL)updateDocumentDataWithType:(LocalDateType)dataType andModel:(DetailModel *)model andUpModel:(DetailModel *)updateModel{
    
    
    return NO;
}
+ (BOOL)deleDocumentDateWithType:(LocalDateType)dataType andModel:(DetailModel *)model{
    
    
    
    return NO;
}
@end
