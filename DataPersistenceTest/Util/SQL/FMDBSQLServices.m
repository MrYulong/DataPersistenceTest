//
//  FMDBSQLServices.m
//  DataPersistenceTest
//
//  Created by 刘玉龙(平安好房技术中心业务研发部用户产品研发团队) on 2017/6/12.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "FMDBSQLServices.h"
#import <FMDB.h>
#import "DetailModel.h"

@interface FMDBSQLServices()

{
    FMDatabase *_dataBase;
}

@end

@implementation FMDBSQLServices

+ (instancetype)shareInstance{
    
    static FMDBSQLServices *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[FMDBSQLServices alloc] init];
        [instance initDataBase];
    });
    
    return instance;
    
}

- (void)initDataBase{
    
    _dataBase = [FMDatabase databaseWithPath:[self.class localSQLPath]];
    
    if (![_dataBase open]) {
        NSLog(@"打开失败");
    }
    //创建用户表
    [_dataBase executeUpdate:@"CREATE TABLE 'userTable'('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'usrName' VARCHAR(255), 'usrpoint' VARCHAR(255), 'contentDesc' VARCHAR(255))"];
    [_dataBase close];
}

+ (NSString *)localSQLPath{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"sql"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    path = [path stringByAppendingPathComponent:@"local.db"];
    return path;
}

- (NSArray *)getDoucmentArray{
    
    NSMutableArray *array = [NSMutableArray new];
    FMResultSet *result = [_dataBase executeQuery:@"select * from userTable"];
    while ([result next]) {
        
        DetailModel *model = [DetailModel new];
        model.usrID         = [result intForColumn:@"id"];
        model.usrName       = [result stringForColumn:@"usrName"];
        model.usrpoint      = [result stringForColumn:@"usrpoint"];
        model.contentDesc   = [result stringForColumn:@"contentDesc"];
        [array addObject:model];
    };
    
    return array;
}
- (BOOL) insetSQLDataModel:(DetailModel *)model{
    
    BOOL isSuccess = [_dataBase executeUpdate:[NSString stringWithFormat:@"insert into userTable(usrName,usrpoint,contentDesc) values(%@,%@,%@)",model.usrName,model.usrpoint,model.contentDesc]];
    
    return isSuccess;
}
- (BOOL) updateSQLDataWithModel:(DetailModel *)model{
    
    BOOL isSuccess = [_dataBase executeUpdate:[NSString stringWithFormat:@"update 'userTable' set usrName = %@ where id = %lu",model.usrName,model.usrID]];
    [_dataBase executeUpdate:[NSString stringWithFormat:@"update 'userTable' set usrpoint = %@ where id = %lu",model.usrpoint,model.usrID]];
    [_dataBase executeUpdate:[NSString stringWithFormat:@"update 'userTable' set contentDesc = %@ where id = %lu",model.contentDesc,model.usrID]];

    return isSuccess;
}
- (BOOL)delSQLDataWithModel:(DetailModel *)model{
    
    return  [_dataBase executeUpdate:[NSString stringWithFormat:@"delete from userTable where id = %lu",model.usrID]];
}


@end
