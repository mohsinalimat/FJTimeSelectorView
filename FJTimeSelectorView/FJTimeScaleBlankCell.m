//
//  FJTimeScaleBlankCell.m
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJTimeScaleStyle.h"
#import "FJTimeScaleBlankCell.h"

@interface FJTimeScaleBlankCell()
// 刻度值
@property (nonatomic, strong) UILabel *valueLable;
@end

@implementation FJTimeScaleBlankCell

#pragma mark --------------- Init Methods
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViewControls];
    }
    return self;
}

#pragma mark --------------- Private Methods

- (void)setupViewControls {
    [self.contentView addSubview:self.valueLable];
}

// 标题 宽度
- (CGFloat)titleWidthWithTitle:(NSString *)title {
    return [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.valueLable.font} context:nil].size.width;
}



#pragma mark --------------- Override Methods
- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger currentIndex = _timeScaleStyle.timeScaleStartValue + (_indexPath.row * _timeScaleStyle.timeScaleCount * _timeScaleStyle.timeScaleUnit);
    self.valueLable.text = [NSString stringWithFormat:@"%ld",currentIndex];
    CGFloat tmpValueLabelWidth = [self titleWidthWithTitle: self.valueLable.text];
    self.valueLable.frame = CGRectMake((self.frame.size.width - tmpValueLabelWidth/2.0), 0, tmpValueLabelWidth, 20);
}

#pragma mark --------------- Getter / Setter

- (void)setTimeScaleStyle:(FJTimeScaleStyle *)timeScaleStyle {
    _timeScaleStyle = timeScaleStyle;
    if (_timeScaleStyle) {
        self.valueLable.font = timeScaleStyle.timeScaleLabelFont;
        self.valueLable.textColor = timeScaleStyle.timeScaleLabelTextColor;
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    if (_indexPath) {
        self.valueLable.hidden = _indexPath.row;
    }
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

@end
