//
//  MDMSetChildrenAgeView.m
//  MDM
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 MDM. All rights reserved.
//

#import "FJTimeScaleStyle.h"
#import "NSString+DayCount.h"
#import "MDMTimeSelectorView.h"
#import "FJTimeSelectorView.h"
#import "MDMSetChildrenAgeView.h"


static const NSInteger kMDChildreAgeSpacing = 20;

static const CGFloat kMDMSetChildrenGenderButtonSize = 95.0f;

static const CGFloat kMDMTimeSelectorViewHeight = 60.0f;

@interface MDMSetChildrenAgeView()<FJTimeSelectorViewDelegate>
// 当前 选择 月份
@property (nonatomic, assign) NSInteger currentSelectedMonth;
// 当前 选择 年份
@property (nonatomic, assign) NSInteger currentSelectedYear;
// 当前 选择 日期
@property (nonatomic, assign) NSInteger currentSelectedDay;
// 时间 刻度
@property (nonatomic, strong) FJTimeScaleStyle *dayTimeScaleStyle;
@end

@implementation MDMSetChildrenAgeView

#pragma mark --------------- Init Methods

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViewControls];
    }
    return self;
}

#pragma mark --------------- Public Methods

// 生日
- (NSString *)birthday {
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld", _currentSelectedYear, _currentSelectedMonth, _currentSelectedDay];
}

#pragma mark --------------- Custom Delegate

- (void)timeSelectorView:(FJTimeSelectorView *)timeSelectorView currentVuale:(NSInteger)currentValue {
    if ([timeSelectorView isEqual:_yearSelectorView.timeSelectorView]) {
        self.currentSelectedYear = currentValue;
    }
    else if([timeSelectorView isEqual:_monthSelectorView.timeSelectorView]) {
        self.currentSelectedMonth = currentValue;
    }
    else if([timeSelectorView isEqual:_daySelectorView.timeSelectorView]) {
        self.currentSelectedDay = currentValue;
    }
     self.daySelectorView.timeSelectorView.timeScaleStyle.timeScaleEndValue = [NSString mdm_dayCountWithYear:_currentSelectedYear month:_currentSelectedMonth];
    [self.daySelectorView.timeSelectorView updateCellNum];
}

#pragma mark --------------- Private Methods

- (void)setupViewControls {
     [self addSubview:self.yearSelectorView];
     [self addSubview:self.monthSelectorView];
     [self addSubview:self.daySelectorView];
}




#pragma mark --------------- Getter / Setter

- (void)setCurrentSelectedDay:(NSInteger)currentSelectedDay {
    _currentSelectedDay = currentSelectedDay;
    _daySelectorView.contentTipLabel.text = [NSString stringWithFormat:@"%ld", _currentSelectedDay];
}

- (void)setCurrentSelectedMonth:(NSInteger)currentSelectedMonth {
    _currentSelectedMonth = currentSelectedMonth;
    _monthSelectorView.contentTipLabel.text = [NSString stringWithFormat:@"%ld", _currentSelectedMonth];
}

- (void)setCurrentSelectedYear:(NSInteger)currentSelectedYear {
    _currentSelectedYear = currentSelectedYear;
    _yearSelectorView.contentTipLabel.text = [NSString stringWithFormat:@"%ld", _currentSelectedYear];
}



// 年份 选择器
- (MDMTimeSelectorView *)yearSelectorView {
    if(!_yearSelectorView){
        _yearSelectorView = [[MDMTimeSelectorView alloc] initWithFrame:CGRectMake(0, 200, self.frame.size.width, kMDMTimeSelectorViewHeight)];
        FJTimeScaleStyle *timeScaleStyle = [[FJTimeScaleStyle alloc] init];
        timeScaleStyle.timeScaleEndValue = [NSString mdm_presentYear];
        timeScaleStyle.timeScaleStartValue = timeScaleStyle.timeScaleEndValue - kMDChildreAgeSpacing;
        timeScaleStyle.timeScaleDefaultValue = timeScaleStyle.timeScaleDefaultValue - kMDChildreAgeSpacing/2.0f;
        timeScaleStyle.timeScaleCount = 5.0f;
        
        self.currentSelectedYear = timeScaleStyle.timeScaleDefaultValue;
        _yearSelectorView.timeSelectorView.timeScaleStyle = timeScaleStyle;
        _yearSelectorView.timeSelectorView.delegate = self;
    }
    return  _yearSelectorView;
}


// 月份 选择器
- (MDMTimeSelectorView *)monthSelectorView {
    if(!_monthSelectorView){
        _monthSelectorView = [[MDMTimeSelectorView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.yearSelectorView.frame) + 14.0f, self.frame.size.width, kMDMTimeSelectorViewHeight)];
        _monthSelectorView.topTipLabel.hidden = YES;
        _monthSelectorView.bottomTipLabel.text = @"月";
        FJTimeScaleStyle *timeScaleStyle = [[FJTimeScaleStyle alloc] init];
        timeScaleStyle.timeScaleEndValue = 12;
        timeScaleStyle.timeScaleStartValue = 1;
        timeScaleStyle.timeScaleDefaultValue = 6;
        timeScaleStyle.timeScaleCount = 1;
        
        self.currentSelectedMonth = timeScaleStyle.timeScaleDefaultValue;
        _monthSelectorView.timeSelectorView.timeScaleStyle = timeScaleStyle;
        _monthSelectorView.timeSelectorView.delegate = self;
    }
    return  _monthSelectorView;
}


// 日期 选择器
- (MDMTimeSelectorView *)daySelectorView {
    if(!_daySelectorView){
        _daySelectorView = [[MDMTimeSelectorView alloc]  initWithFrame:CGRectMake(0, CGRectGetMaxY(self.monthSelectorView.frame), self.frame.size.width, kMDMTimeSelectorViewHeight)];
        _daySelectorView.bottomTipLabel.text = @"日";

        FJTimeScaleStyle *timeScaleStyle = [[FJTimeScaleStyle alloc] init];
        timeScaleStyle.timeScaleEndValue = [NSString mdm_dayCountWithYear:_currentSelectedYear month:_currentSelectedMonth];
        timeScaleStyle.timeScaleStartValue = 0;
        timeScaleStyle.timeScaleDefaultValue = 6;
        timeScaleStyle.timeScaleCount = 5;
        self.currentSelectedDay = timeScaleStyle.timeScaleDefaultValue;
        
        _daySelectorView.topTipLabel.hidden = YES;
        _daySelectorView.timeSelectorView.timeScaleStyle = timeScaleStyle;
        _daySelectorView.timeSelectorView.delegate = self;
    }
    return  _daySelectorView;
}


@end
