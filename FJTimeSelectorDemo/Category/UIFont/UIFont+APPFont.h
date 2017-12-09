//
//  UIFont+APPFont.h
//  DeJiaIM
//
//  Created by xianjb on 2016/11/2.
//  Copyright © 2016年 tsningning. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AppFontWeightType) {
    AppFontWeightTypeRegular,
    AppFontWeightTypeLight,
    AppFontWeightTypeMedium,
    AppFontWeightTypeSemibold,
    AppFontWeightTypeDINAitemateBold,
};

typedef NS_ENUM(NSUInteger, AppFontType) {
    
    /**************************** 1.默认字体 ****************************/
    
    // ****** PingFangSC ****** //
    /**
     *  18pt 特大标题/提示语
     */
    AppFontTypeA,
    /**
     *  17pt
     */
    AppFontTypeB,
    /**
     *  16pt 按钮
     */
    AppFontTypeC,
    /**
     *  15pt 课程详情标题/标题
     */
    AppFontTypeD,
    /**
     *  14pt 主标题/输入状态，提示/内容
     */
    AppFontTypeE,
    /**
     *  13pt 内容，次级内容展示/提示
     */
    AppFontTypeF,
    /**
     *  12pt 小标题/提示
     */
    AppFontTypeG,
    /**
     *  11pt 时间/次级内容/次级提示
     */
    AppFontTypeH,
    /**
     *  10pt 标签/名字内容
     */
    AppFontTypeI,
    
    
    /**************************** 2.数字字体 ****************************/
    
    // ****** DINAlternate Bold ****** //
    /**
     *  18pt 课程详情价钱数字字体
     */
    AppNumFontTypeA,
    /**
     *  14pt cell中提示文本
     */
    AppNumFontTypeB,
    /**
     *  10pt cell中提示更新
     */
    AppNumFontTypeC,


    /**************************** 3.粗体字体 ****************************/
    /**
     *  18pt 导航/特大标题
     */
    AppBoldFontTypeA,
    
};

@interface UIFont (APPFont)

/**
 *  APP设置字体的方法
 *
 *  @param customFontType 字体类型
 *
 *  @return UIFont
 */
+ (UIFont *)fontWithCustomType:(AppFontType)customFontType;

/**
 *  APP设置字体的方法
 *
 *  @param customFontType 字体类型
 *  @param weightType     字体字重
 *
 *  @return UIFont
 */
+ (UIFont *)fontWithCustomType:(AppFontType)customFontType weightType:(AppFontWeightType)weightType;

/**
 *  APP设置字体的方法
 *
 *  @param customFontType 字体类型
 *  @param scale          字体缩放比例
 *
 *  @return UIFont
 */
+ (UIFont *)fontWithCustomType:(AppFontType)customFontType scale:(CGFloat)scale;

/**
 *  APP设置字体的方法
 *
 *  @param customFontType 字体类型
 *  @param weightType     字体字重
 *  @param scale          字体缩放比例
 *
 *  @return UIFont
 */
+ (UIFont *)fontWithCustomType:(AppFontType)customFontType weightType:(AppFontWeightType)weightType scale:(CGFloat)scale;

/**
 *  APP设置等宽字体的方法
 *
 *  @param customFontType 字体类型
 *
 *  @return UIFont
 */
+ (UIFont *)monospacedDigitFontWithCustomType:(AppFontType)customFontType;

@end
