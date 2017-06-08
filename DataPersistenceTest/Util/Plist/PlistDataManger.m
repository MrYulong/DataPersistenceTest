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
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"local/local.plist"];
    return path;
}

+ (BOOL)updateDocumentPlistArrayWithArr:(NSArray *)array{
    
    BOOL success = [array writeToFile:[self localPlistPath] atomically:YES];
    
    return success;
}

+ (NSArray *)getDocumentPlistArray{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[self localPlistPath]];
    
    return array;
}

@end
