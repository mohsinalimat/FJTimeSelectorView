//
//  FJTimeScaleCell.m
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 fjf. All rights reserved.
//

// model
#import "FJTimeScaleModel.h"
#import "FJTimeScaleStyle.h"
// view
#import "FJTimeScaleCell.h"

@interface FJTimeScaleCell()

// 正常 高度
@property (nonatomic, assign) CGFloat timeScaleHeight;

// 最大 高度
@property (nonatomic, assign) CGFloat timeScaleMaxHeight;

// timeSacleCount
@property (nonatomic, assign) NSInteger timeSacleCount;

// 刻度值
@property (nonatomic, strong) UILabel *valueLable;

// 刻度线
@property (nonatomic,strong) CAShapeLayer *lineLayer;

// 数据源
@property (nonatomic, strong) NSMutableArray <FJTimeScaleModel *>*dataSources;
@end

@implementation FJTimeScaleCell

#pragma mark --------------- Init Methods
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         [self setupViewControls];
    }
    return self;
}

#pragma mark --------------- Private Methods

- (void)setupViewControls {
    self.timeScaleHeight = 20.0f;
    self.timeSacleCount = 10.0f;
    self.timeScaleMaxHeight = 40.0f;
    [self.contentView addSubview:self.valueLable];
    [self calculateDataModel];
    [self drawTimeScaleLine];
}

// 计算 位置
- (void)calculateDataModel {
    
    CGFloat timeSacleSpacing = _timeScaleStyle.timeScaleItemSize.width / self.timeSacleCount;
    
    [self.dataSources removeAllObjects];
    for (int index = 0; index < self.timeSacleCount + 1; index++) {
        
        NSInteger currentIndex = _timeScaleStyle.timeScaleStartValue + ((_indexPath.row - 1) * _timeScaleStyle.timeScaleCount * _timeScaleStyle.timeScaleUnit) + index;
        if (currentIndex <= _timeScaleStyle.timeScaleEndValue) {
            FJTimeScaleModel *model = [[FJTimeScaleModel alloc] init];
            model.movePoint = CGPointMake(index * timeSacleSpacing, self.frame.size.height);
            
            // 第一个cell 的 第一个 刻度线
            if(index == 0 && self.indexPath.row == 1) {
                model.addPoint = CGPointMake(index * timeSacleSpacing, self.frame.size.height - self.timeScaleMaxHeight);
            }
            // 每个cell 最后一个 刻度线
            else if (index == self.timeSacleCount) {
                model.addPoint = CGPointMake(index * timeSacleSpacing, self.frame.size.height - self.timeScaleMaxHeight);
            }
            else {
                model.addPoint = CGPointMake(index * timeSacleSpacing, self.frame.size.height - self.timeScaleHeight);
            }
            
            [self.dataSources addObject:model];
        }
    }
}

// 绘制 线条
- (void)drawTimeScaleLine {
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    for (FJTimeScaleModel *model in self.dataSources) {
        [linePath moveToPoint:model.movePoint];
        [linePath addLineToPoint:model.addPoint];
    }
    self.lineLayer.path = linePath.CGPath;
    [self.contentView.layer addSublayer:self.lineLayer];
}

// 标题 宽度
- (CGFloat)titleWidthWithTitle:(NSString *)title {
    
    return [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.valueLable.font} context:nil].size.width;
}

// 更新
- (void)updateTimeScaleInfoControls {
    if (_lineLayer.superlayer) {
         [_lineLayer removeFromSuperlayer];
    }
   
    [self calculateDataModel];
    [self drawTimeScaleLine];
    [self layoutSubviews];
}

#pragma mark --------------- Override Methods

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger currentIndex = _timeScaleStyle.timeScaleStartValue + (_indexPath.row * _timeScaleStyle.timeScaleCount * _timeScaleStyle.timeScaleUnit);
    self.valueLable.text = [NSString stringWithFormat:@"%ld",currentIndex];
    if (currentIndex <= _timeScaleStyle.timeScaleEndValue) {
        CGFloat tmpValueLabelWidth = [self titleWidthWithTitle: self.valueLable.text];
        self.valueLable.hidden = NO;
        self.valueLable.frame = CGRectMake((self.frame.size.width - tmpValueLabelWidth/2.0), 0, tmpValueLabelWidth, 20);
    }
    else {
        self.valueLable.hidden = YES;
    }
}



#pragma mark --------------- Getter / Setter

- (void)setTimeScaleStyle:(FJTimeScaleStyle *)timeScaleStyle {
    _timeScaleStyle = timeScaleStyle;
    if (_timeScaleStyle) {
        self.timeSacleCount = timeScaleStyle.timeScaleCount;
        self.timeScaleHeight = timeScaleStyle.timeScaleLineNormalHeight;
        self.timeScaleMaxHeight = timeScaleStyle.timeScaleLineMaxHeight;
        self.valueLable.font = timeScaleStyle.timeScaleLabelFont;
        self.valueLable.textColor = timeScaleStyle.timeScaleLabelTextColor;
        self.lineLayer.strokeColor = timeScaleStyle.timeScaleLineColor.CGColor;
        self.lineLayer.lineWidth = timeScaleStyle.timeScaleLineWidth;
        [self updateTimeScaleInfoControls];
    }
}
// 数据源
- (NSMutableArray <FJTimeScaleModel *>*)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

// 刻度值
- (UILabel *)valueLable {
    if(!_valueLable){
        _valueLable = [[UILabel alloc] init];
        _valueLable.font = [UIFont systemFontOfSize:10];
        _valueLable.textColor = [UIColor redColor];
        _valueLable.textAlignment = NSTextAlignmentCenter;
    }
    return  _valueLable;
}

// 刻度线
- (CAShapeLayer *)lineLayer {
    if(!_lineLayer){
        _lineLayer =  [CAShapeLayer layer];;
        _lineLayer.lineWidth = 1;
        _lineLayer.strokeColor = [UIColor redColor].CGColor;
        _lineLayer.fillColor = nil; // 默认为blackColor
    }
    return  _lineLayer;
}
@end
