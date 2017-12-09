
//
//  MDMTimeSelectorView.m
//  MDM
//
//  Created by fjf on 2017/12/7.
//  Copyright © 2017年 MDM. All rights reserved.
//

// category
#import "UIFont+APPFont.h"
#import "UIColor+APPColor.h"
// view
#import "FJTimeSelectorView.h"
#import "MDMTimeSelectorView.h"


static const CGFloat kFJTimeSelectorViewX = 68.0f;

static const CGFloat kMDMTimeSelectorViewEdgeSpacing = 17.0f;

@implementation MDMTimeSelectorView

#pragma mark --------------- Life Circle

#pragma mark --------------- Init Methods
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         [self setupViewControls];
    }
    return self;
}

#pragma mark --------------- Private Methods

- (void)setupViewControls {
    [self addSubview:self.timeSelectorView];
    [self addSubview:self.topTipLabel];
    [self addSubview:self.contentTipLabel];
    [self addSubview:self.bottomTipLabel];
}



#pragma mark --------------- Getter / Setter

// timeSelectorView
- (FJTimeSelectorView *)timeSelectorView {
    if(!_timeSelectorView){
        CGFloat timeSelectorViewX = kFJTimeSelectorViewX;
        CGFloat timeSelectorWidth = self.frame.size.width - timeSelectorViewX - kMDMTimeSelectorViewEdgeSpacing;
        _timeSelectorView = [[FJTimeSelectorView alloc] initWithFrame:CGRectMake(kFJTimeSelectorViewX, 0, timeSelectorWidth, self.frame.size.height)];
    }
    return  _timeSelectorView;
}

// topTipLabel
- (UILabel *)topTipLabel {
    if(!_topTipLabel){
        CGFloat tipLabelWidth = kFJTimeSelectorViewX - kMDMTimeSelectorViewEdgeSpacing -12.0f;
        CGFloat tipLabelHeight = self.frame.size.height / 3.0f;
        _topTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMDMTimeSelectorViewEdgeSpacing, CGRectGetMinY(self.timeSelectorView.frame), tipLabelWidth, tipLabelHeight)];
        _topTipLabel.textAlignment = NSTextAlignmentRight;
        _topTipLabel.textColor =  [UIColor colorWithCustomType:AppColorTypeFontD];
        _topTipLabel.font = [UIFont fontWithCustomType:AppFontTypeG weightType:AppFontWeightTypeRegular];
        _topTipLabel.text = @"出生";
    }
    return  _topTipLabel;
}


// contentTipLabel
- (UILabel *)contentTipLabel {
    if(!_contentTipLabel){
        CGFloat tipLabelWidth = kFJTimeSelectorViewX - kMDMTimeSelectorViewEdgeSpacing -12.0f;
        CGFloat tipLabelHeight = self.frame.size.height / 3.0f;
        _contentTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMDMTimeSelectorViewEdgeSpacing, CGRectGetMaxY(self.topTipLabel.frame), tipLabelWidth, tipLabelHeight)];
        _contentTipLabel.textAlignment = NSTextAlignmentRight;
        _contentTipLabel.textColor =  [UIColor colorWithCustomType:AppColorTypeA];
        _contentTipLabel.font = [UIFont fontWithCustomType:AppFontTypeC weightType:AppFontWeightTypeDINAitemateBold];
        _contentTipLabel.text = @"1996";
    }
    return  _contentTipLabel;
}

// bottomTipLabel
- (UILabel *)bottomTipLabel {
    if(!_bottomTipLabel){
        CGFloat tipLabelWidth = kFJTimeSelectorViewX - kMDMTimeSelectorViewEdgeSpacing -12.0f;
        CGFloat tipLabelHeight = self.frame.size.height / 3.0f;
        _bottomTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMDMTimeSelectorViewEdgeSpacing, CGRectGetMaxY(self.contentTipLabel.frame), tipLabelWidth, tipLabelHeight)];
        _bottomTipLabel.textAlignment = NSTextAlignmentRight;
        _bottomTipLabel.textColor =  [UIColor colorWithCustomType:AppColorTypeFontD];
        _bottomTipLabel.font = [UIFont fontWithCustomType:AppFontTypeG weightType:AppFontWeightTypeRegular];
        _bottomTipLabel.text = @"年";
    }
    return  _bottomTipLabel;
}
@end
