//
//  MyCollectionViewCell.h
//  CustomCollectionViewDemo
//
//  Created by iOS开发者 on 2017/2/13.
//  Copyright © 2017年 iOS开发者. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCollectionViewModel;
@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@property(nonatomic,strong)MyCollectionViewModel *model;

@end
