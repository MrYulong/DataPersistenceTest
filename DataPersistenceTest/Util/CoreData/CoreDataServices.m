//
//  CoreDataServices.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/14.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "CoreDataServices.h"
#import "PersistenceContextManager.h"
#import "UserManagerObject.h"
#import "DetailModel.h"

@implementation CoreDataServices

+ (instancetype)shareInstance{
    
    static CoreDataServices *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
    });
    return instance;
}


- (NSArray *)fetchLocalDataArray{
    
    NSManagedObjectContext *context = [[PersistenceContextManager shareInstance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:fetchRequest error:&error];
    
    NSMutableArray *mubArray = [NSMutableArray new];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DetailModel *model = [UserManagerObject transfromModelFromObject:(UserManagerObject *)obj];
        [mubArray addObject:model];
    }];
    return mubArray.count?mubArray:nil;
}

- (BOOL)addNewItemModel:(DetailModel *)model{
    
    NSManagedObjectContext *context = [[PersistenceContextManager shareInstance] managedObjectContext];
    //组装id
    NSInteger index = [self fetchLocalDataArray]?[self fetchLocalDataArray].count:0;
    model.usrID = index + 1;
    UserManagerObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [UserManagerObject transfromObjectFromModel:model toObject:object];
    
    NSError *error = nil;
    [context save:&error];
    
    if (error) {
        
        NSLog(@"添加失败");
    }
    return !error;
}

- (BOOL)deleteItemModel:(DetailModel *)model{
    
    NSManagedObjectContext *context = [[PersistenceContextManager shareInstance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate= [NSPredicate predicateWithFormat:@"usrID== %lu",model.usrID];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    [fetchedObjects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [context deleteObject:obj];
    }];

    [context save:&error];
    
    return !error;
}
- (BOOL)updateItemModel:(DetailModel *)model{
    
    NSManagedObjectContext *context = [[PersistenceContextManager shareInstance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate= [NSPredicate predicateWithFormat:@"usrID==%lu",model.usrID];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    [fetchedObjects enumerateObjectsUsingBlock:^(UserManagerObject *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.usrName = model.usrName;
        obj.usrpoint = model.usrpoint;
        obj.contentDesc = model.contentDesc;
        
    }];
    [context save:&error];

    return !error;
}



@end
