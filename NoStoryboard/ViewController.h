//
//  ViewController.h
//  NoStoryboard
//
//  Created by macbook pro on 10/16/16.
//  Copyright © 2016 berkaysebat.com.Practice. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray     *content;
@property UIImageView *dot;
@property NSString *demo;

@end

