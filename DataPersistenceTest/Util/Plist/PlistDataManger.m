//
//  PlistDataManger.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "PlistDataManger.h"

@implementation PlistDataManger


+ (NSString *)localPlistPath{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    path = [path stringByAppendingPathComponent:@"local.plist"];
    return path;
}

+ (BOOL)updateDocumentPlistArrayWithArr:(NSArray *)array{
    
    return [array writeToFile:[self localPlistPath] atomically:YES];
}

+ (NSArray *)getDocumentPlistArray{
    
    return [NSArray arrayWithContentsOfFile:[self localPlistPath]];
}

@end
