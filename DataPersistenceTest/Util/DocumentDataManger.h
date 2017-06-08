//
//  DocumentDataManger.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, LocalDateType) {
    LocalDateTypePlist             = 1,
    LocalDateTypeSQL,
    LocalDateTypeCoreData,
    LocalDateTypeCoreKetedArchiver
};


@interface DocumentDataManger : NSObject

@property (nonatomic, assign) LocalDateType dataType;

@end
