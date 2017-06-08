//
//  AddInfosViewController.h
//  DataPersistenceTest
//
//  Created by long_ on 2017/6/8.
//  Copyright © 2017年 long_. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailModel;
@class AddInfosViewController;

@protocol AddInfosViewControllerDelegate <NSObject>

//更新DetailModel
- (void)addInfosViewController:(AddInfosViewController *)viewController lastModel:(DetailModel *)aLastModel updateModel:(DetailModel *)upModel;
//保存新的DetailModel
- (void)addInfosViewController:(AddInfosViewController *)viewController  insertModel:(DetailModel *)inModel;



@end

@interface AddInfosViewController : UIViewController

@property (nonatomic, assign) id<AddInfosViewControllerDelegate> delegate;
@property (nonatomic, strong) DetailModel *currentModel;

@end
