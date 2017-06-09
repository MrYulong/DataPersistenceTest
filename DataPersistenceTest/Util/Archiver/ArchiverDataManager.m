//
//  ArchiverDataManager.m
//  DataPersistenceTest
//
//  Created by 刘玉龙(平安好房技术中心业务研发部用户产品研发团队) on 2017/6/9.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "ArchiverDataManager.h"

@implementation ArchiverDataManager

#define ARCHIVERKEY  @"ARCHIVERKEY"

+ (NSString *)localDataPath{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"Archiver"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    path = [path stringByAppendingPathComponent:@"local.data"];
    return path;
}

+ (NSArray *)getLocalDocumentData{
    
    NSData *data = [NSData dataWithContentsOfFile:[self localDataPath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSArray *array = [unarchiver decodeObjectForKey:ARCHIVERKEY];
    [unarchiver finishDecoding];
    
    return array;
}

+ (BOOL)updateLocalDataWithArray:(NSArray *)array{
    
    NSMutableData* data = [NSMutableData data];
    NSKeyedArchiver  *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:array forKey:ARCHIVERKEY];
    [archiver finishEncoding];
    return [data writeToFile:[self localDataPath] atomically:YES];
}




@end
