//
//  PlistDataManger.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistDataManger : NSObject

///更新
+ (BOOL)updateDocumentPlistArrayWithArr:(NSArray *)array;
///查询
+ (NSArray *)getDocumentPlistArray;

@end
