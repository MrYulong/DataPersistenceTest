//
//  UserManagerObject.m
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/14.
//  Copyright © 2017年 long_. All rights reserved.
//

#import "UserManagerObject.h"
#import "DetailModel.h"

@implementation UserManagerObject

@dynamic usrName;
@dynamic usrpoint;
@dynamic contentDesc;
@dynamic usrID;



+ (DetailModel *)transfromModelFromObject:(UserManagerObject *)object{
    
    DetailModel *model = [DetailModel new];
    model.usrID         = object.usrID;
    model.usrName       = object.usrName;
    model.contentDesc   = object.contentDesc;
    model.usrpoint      = object.usrpoint;
    
    return model;
}

+ (void)transfromObjectFromModel:(DetailModel *)model toObject:(UserManagerObject *)object{
    
    NSDictionary *dic = [DetailModel dicFromModel:model];
    [object setValuesForKeysWithDictionary:dic];
}

@end
