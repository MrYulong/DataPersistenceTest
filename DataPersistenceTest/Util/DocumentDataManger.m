//
//  DocumentDataManger.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "DocumentDataManger.h"
#import "PlistDataManger.h"


@implementation DocumentDataManger

+ (NSArray *)loadDocumentData:(LocalDateType)dataType{
    
    NSArray *array = [NSArray new];
    
    switch (dataType) {
        case LocalDateTypePlist:
            array = [PlistDataManger getDocumentPlistArray];
            break;
        default:
            break;
    }
    return array;
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
