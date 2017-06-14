//
//  ArchiverDataManager.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/9.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiverDataManager : NSObject

+ (NSArray *)getLocalDocumentData;

+ (BOOL)updateLocalDataWithArray:(NSArray *)array;
@end
