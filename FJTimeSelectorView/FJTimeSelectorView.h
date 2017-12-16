//
//  FJTimeSelectorView.h
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/5.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJTimeScaleStyle;
@class FJTimeSelectorView;

@protocol FJTimeSelectorViewDelegate<NSObject>
- (void)timeSelectorView:(FJTimeSelectorView *)timeSelectorView currentVuale:(NSInteger)currentValue;
@end

@interface FJTimeSelectorView : UIView
// 更新 cellNum
- (void)updateCellNum;
// timeScaleStyle
@property (nonatomic, strong) FJTimeScaleStyle *timeScaleStyle;
// 委托
@property (nonatomic, weak) id <FJTimeSelectorViewDelegate> delegate;
@end
