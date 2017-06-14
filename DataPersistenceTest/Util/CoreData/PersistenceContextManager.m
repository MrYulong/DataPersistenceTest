//
//  PersistenceContextManager.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/14.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "PersistenceContextManager.h"

@implementation PersistenceContextManager


+ (instancetype)shareInstance{
    
    static PersistenceContextManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

- (NSString *)dataPath{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"coredata"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    path = [path stringByAppendingPathComponent:@"local.sqlite"];
    return path;
}

#pragma mark -
#pragma mark GET

- (NSManagedObjectModel *)managedObject{
    
    if (!_managedObject) {
        
        _managedObject = [NSManagedObjectModel mergedModelFromBundles:nil];
        
    }
    return _managedObject;
    
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    
    if (!_persistentStoreCoordinator) {
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObject];
        NSDictionary * options = @{NSMigratePersistentStoresAutomaticallyOption: @YES, NSInferMappingModelAutomaticallyOption: @YES};
        NSURL *url = [NSURL fileURLWithPath:[self dataPath]];
        
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:options error:nil]) {
            //handle error
            NSAssert1(YES, @"Failed to create store:%@ with NSSQLiteType",[url path]);
        }        
    }
    return _persistentStoreCoordinator;
}

-(NSManagedObjectContext *)managedObjectContext{
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    return _managedObjectContext;
}

@end
