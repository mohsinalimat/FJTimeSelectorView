//
//  FJTimeScaleStyle.m
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJTimeScaleStyle.h"

@implementation FJTimeScaleStyle
#pragma mark --------------- Init Methods
- (instancetype)init {
    if (self = [super init]) {
        _timeScaleLineNormalHeight = 8.0f;
        _timeScaleLineMaxHeight = 15.0f;
        _timeScaleCount = 5.0f;
        _timeScaleUnit = 1.0f;
        _timeScaleLineWidth = 1.0f;
        _timeScaleStartValue = 2000;
        _timeScaleEndValue = 2100;
        _timeScaleDefaultValue = 2017;
        _timeScaleItemSize = CGSizeMake(70, 60);
        _timeScaleLineColor = [UIColor lightGrayColor];
        _timeScaleLabelTextColor = [UIColor grayColor];
        _timeScaleLabelFont = [UIFont boldSystemFontOfSize:11.0f];
        _collectionViewBorderWidth = 0.5f;
        _collectionViewBorderColor = [UIColor lightGrayColor];
        _indicatorViewBackgroundColor = [UIColor greenColor];
        _indicatorViewLineWidth = 2.0f;
        _indicatorViewLayerWidth = 6.0f;
        _indicatorViewLayerHeight = 24.0f;
        _indicatorViewHeaderHeight = 6.0f;
    }
    return self;
}
@end
