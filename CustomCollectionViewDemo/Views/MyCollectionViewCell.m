//
//  MyCollectionViewCell.m
//  CustomCollectionViewDemo
//
//  Created by iOS开发者 on 2017/2/13.
//  Copyright © 2017年 iOS开发者. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "MyCollectionViewModel.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(MyCollectionViewModel *)model{
    _model = model;
    self.nameLbl.text = model.nameLbl;
}

@end
