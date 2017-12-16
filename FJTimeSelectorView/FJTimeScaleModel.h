//
//  FJTimeScaleModel.h
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/6.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJTimeScaleModel : NSObject
//位于轴线的坐标点
@property (nonatomic, assign) CGPoint movePoint;
//远离轴线的坐标点
@property (nonatomic, assign) CGPoint addPoint;
@end
