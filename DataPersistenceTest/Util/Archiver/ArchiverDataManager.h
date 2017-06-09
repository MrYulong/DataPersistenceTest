//
//  ArchiverDataManager.h
//  DataPersistenceTest
//
//  Created by 刘玉龙(平安好房技术中心业务研发部用户产品研发团队) on 2017/6/9.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiverDataManager : NSObject

+ (NSArray *)getLocalDocumentData;

+ (BOOL)updateLocalDataWithArray:(NSArray *)array;
@end
