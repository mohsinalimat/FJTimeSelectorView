//
//  FJTimeScaleCell.h
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJTimeScaleStyle;

@interface FJTimeScaleCell : UICollectionViewCell
// timeScaleStyle
@property (nonatomic, strong) FJTimeScaleStyle *timeScaleStyle;
// 索引
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
