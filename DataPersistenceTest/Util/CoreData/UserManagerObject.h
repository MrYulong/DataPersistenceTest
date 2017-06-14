//
//  UserManagerObject.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/14.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <CoreData/CoreData.h>
@class DetailModel;

@interface UserManagerObject : NSManagedObject

@property (nonatomic, copy) NSString *usrName;
@property (nonatomic, copy) NSString *usrpoint;
@property (nonatomic, copy) NSString *contentDesc;
@property (nonatomic, assign) int16_t usrID;

+ (DetailModel *)transfromModelFromObject:(UserManagerObject *)object;

+ (void)transfromObjectFromModel:(DetailModel *)model toObject:(UserManagerObject *)object;

@end
