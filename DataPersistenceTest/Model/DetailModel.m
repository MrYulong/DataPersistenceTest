//
//  DetailModel.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        _usrName = [aDecoder decodeObjectForKey:@"userName"];
        _usrpoint = [aDecoder decodeObjectForKey:@"usrpoint"];
        _contentDesc = [aDecoder decodeObjectForKey:@"contentDesc"];
        _usrID = [aDecoder decodeIntegerForKey:@"usrID"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.usrName forKey:@"userName"];
    [aCoder encodeObject:self.usrpoint forKey:@"usrpoint"];
    [aCoder encodeObject:self.contentDesc forKey:@"contentDesc"];
    [aCoder encodeInteger:self.usrID forKey:@"usrID"];

}

- (id)copyWithZone:(NSZone *)zone{
    
    DetailModel *instance = [[[self class] alloc] copyWithZone:zone];
    instance.usrName = self.usrName.copy;
    instance.usrpoint = self.usrpoint.copy;
    instance.contentDesc = self.contentDesc.copy;
    instance.usrID = self.usrID;

    return instance;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}
+ (NSDictionary *) dicFromModel:(DetailModel *)model{
    
    return @{@"usrID"       : @(model.usrID)?:@"",
             @"usrName"     : model.usrName?:@"",
             @"usrpoint"    : model.usrpoint?:@"",
             @"contentDesc" : model.contentDesc?:@""};
    
}

+ (DetailModel *) modelFromDic:(NSDictionary *)dic{
    
    DetailModel *model = [[DetailModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

@end
