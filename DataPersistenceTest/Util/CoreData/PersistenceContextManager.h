//
//  PersistenceContextManager.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/14.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistenceContextManager : NSObject

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic,strong) NSManagedObjectModel *managedObject;

@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (instancetype)shareInstance;


@end
