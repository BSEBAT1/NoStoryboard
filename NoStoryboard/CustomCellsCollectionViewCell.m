//
//  CustomCellsCollectionViewCell.m
//  NoStoryboard
//
//  Created by macbook pro on 10/28/16.
//  Copyright © 2016 berkaysebat.com.Practice. All rights reserved.
//

#import "CustomCellsCollectionViewCell.h"

@implementation CustomCellsCollectionViewCell

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        self.imageView = [[UIImageView alloc]init];
//        self.imageView.frame = CGRectMake(26, 27, 90, 90);
//        self.tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(26, 125, 90, 21)];
//        self.locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 156, 121, 21)];
//        self.tempLabel.textAlignment = NSTextAlignmentCenter;
//        self.tempLabel.textColor = [UIColor whiteColor];
//        self.locationLabel.textAlignment = NSTextAlignmentCenter;
//        self.locationLabel.textColor = [UIColor whiteColor];
//        
//        [self.viewForBaselineLayout addSubview:self.imageView];
//        [self.viewForBaselineLayout addSubview:self.tempLabel];
//        [self.viewForBaselineLayout addSubview:self.locationLabel];
//        
//        self.viewForBaselineLayout.layer.masksToBounds = YES;
//        self.viewForBaselineLayout.layer.cornerRadius = 8.0f;
//    }
//    return self;
//}
- (id)initWithFrame:(CGRect)frame{
     self = [super initWithFrame:frame];
   
   CGRect framey= CGRectMake(CGRectGetMidX(frame), CGRectGetMidY(frame), 100, 100);
  
    self.tempLabel = [[UILabel alloc]initWithFrame:framey];
   
    self.tempLabel.text=@"DONKEY";
     [self.viewForBaselineLayout addSubview:self.tempLabel];
    NSDictionary *viewsDictionary = @{@"redView":self.tempLabel};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[redView]"
    options:0
    metrics:nil
    views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[redView]"
    options:0
    metrics:nil
    views:viewsDictionary];
    
    
    [self addConstraints:constraint_POS_H];
    [self addConstraints:constraint_POS_V];
   
    return self;
    
}



@end
