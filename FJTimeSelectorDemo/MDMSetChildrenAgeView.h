//
//  MDMSetChildrenAgeView.h
//  MDM
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 MDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDMTimeSelectorView;

@interface MDMSetChildrenAgeView : UIView

// 年龄 选择器
@property (nonatomic, strong) MDMTimeSelectorView *yearSelectorView;

// 月份 选择器
@property (nonatomic, strong) MDMTimeSelectorView *monthSelectorView;

// 日期 选择器
@property (nonatomic, strong) MDMTimeSelectorView *daySelectorView;


// 生日
- (NSString *)birthday;
@end
