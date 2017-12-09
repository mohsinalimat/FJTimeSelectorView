//
//  MDMTimeSelectorView.h
//  MDM
//
//  Created by fjf on 2017/12/7.
//  Copyright © 2017年 MDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJTimeSelectorView;

@interface MDMTimeSelectorView : UIView

// timeSelectorView
@property (nonatomic, strong) FJTimeSelectorView *timeSelectorView;

// topTipLabel
@property (nonatomic, strong) UILabel *topTipLabel;

// contentTipLabel
@property (nonatomic, strong) UILabel *contentTipLabel;

// bottomTipLabel
@property (nonatomic, strong) UILabel *bottomTipLabel;
@end
