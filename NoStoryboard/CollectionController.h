//
//  CollectionController.h
//  NoStoryboard
//
//  Created by macbook pro on 10/28/16.
//  Copyright © 2016 berkaysebat.com.Practice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellsCollectionViewCell.h"

@interface CollectionController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;

@end
