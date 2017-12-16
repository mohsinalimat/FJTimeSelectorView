//
//  FJTimeScaleStyle.h
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJTimeScaleStyle : NSObject
// 刻度线 正常 高度
@property (nonatomic, assign) CGFloat timeScaleLineNormalHeight;

// 刻度线 最大 高度
@property (nonatomic, assign) CGFloat timeScaleLineMaxHeight;

// 刻度cell size
@property (nonatomic, assign) CGSize timeScaleItemSize;

// 刻度线 数量
@property (nonatomic, assign) NSInteger timeScaleCount;

// 刻度线 宽度
@property (nonatomic, assign) CGFloat timeScaleLineWidth;

// 刻度单位 (一刻度代表多少值)
@property (nonatomic, assign) NSInteger timeScaleUnit;

// 刻度线 开始 值
@property (nonatomic, assign) NSInteger timeScaleStartValue;

// 刻度线 结束 值
@property (nonatomic, assign) NSInteger timeScaleEndValue;

// 刻度线 默认值
@property (nonatomic, assign) NSInteger timeScaleDefaultValue;

// 刻度线 颜色
@property (nonatomic, strong) UIColor *timeScaleLineColor;

// 刻度 label 字体 颜色
@property (nonatomic, strong) UIColor *timeScaleLabelTextColor;

// 刻度 label 字体 大小
@property (nonatomic, strong) UIFont *timeScaleLabelFont;

// collectionView 边框 宽度
@property (nonatomic, assign) CGFloat collectionViewBorderWidth;

// collectionView 边框 颜色
@property (nonatomic, strong) UIColor *collectionViewBorderColor;

// indicatorLineWidth
@property (nonatomic, assign) CGFloat indicatorViewLineWidth;

// indicatorLayerWidth
@property (nonatomic, assign) CGFloat indicatorViewLayerWidth;

// indicatorLayerHeight
@property (nonatomic, assign) CGFloat indicatorViewLayerHeight;

// indicatorHeaderHeight
@property (nonatomic, assign) CGFloat indicatorViewHeaderHeight;

// 指示器 颜色
@property (nonatomic, strong) UIColor *indicatorViewBackgroundColor;
@end
