//
//  ViewController.h
//  NoStoryboard
//
//  Created by macbook pro on 10/16/16.
//  Copyright © 2016 berkaysebat.com.Practice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionController.h"
#import "PlayerState.h"






@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray     *content;
@property UIImageView *dot;
@property NSString *demo;
@property NSInteger *haplo;


typedef NS_ENUM(NSInteger,Fruits ) {
    Fruits_Apple,
    Fruits_Banana,
    Anything_you_want
};



@end

