//
//  UIColor+APPColor.h
//  DeJiaIM
//
//  Created by xianjb on 2016/11/2.
//  Copyright © 2016年 tsningning. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
                                    1.APP主题颜色类型
                                    2.APP字体颜色类型
                                    3.APP按钮状态颜色类型
 */

typedef NS_ENUM(NSUInteger, AppColorType) {
    
    
    /*---------------------------- 1.APP主题颜色类型 ----------------------------*/
    /**
     *  #22B39B 100%    主色，浅绿色
     */
    AppColorTypeA,
    /**
     *  #20A58E 100%    搜索框颜色，深绿色
     */
    AppColorTypeB,
    /**
     *  #EFF1F2 100%    线条分割色
     */
    AppColorTypeC,
    /**
     *  #FBFBFB 100%    背景色，灰白
     */
    AppColorTypeD,
    /**
     *  #1D1D20 60%     蒙版色
     */
    AppColorTypeE,
    /**
     *  #22B39B 50%     主色阴影
     */
    AppColorTypeF,
    /**
     *  #FF5C90 100%    消息提示背景色
     */
    AppColorTypeG,
    /**
     *  #FFFFFF 100%    背景色，纯白
     */
    AppColorTypeH,
    
    
    /*---------------------------- 2.APP字体颜色类型 ----------------------------*/
    /**
     *  #FFFFFF 100%    导航
     */
    AppColorTypeFontA,
    /**
     *  #292B2A 100%    特大标题/提醒，深黑
     */
    AppColorTypeFontB,
    /**
     *  #505251 100%    主标题
     */
    AppColorTypeFontC,
    /**
     *  #666666 100%    内容/评论内容
     */
    AppColorTypeFontD,
    /**
     *  #AEAFAF 100%    次要内容
     */
    AppColorTypeFontE,
    /**
     *  #DBDBDB 100%    提示内容
     */
    AppColorTypeFontF,
    /**
     *  #6DC9B9 100%    首页导航，浅绿
     */
    AppColorTypeFontG,
    /**
     *  #B8E4DC 100%    不可点击按钮，淡绿
     */
    AppColorTypeFontH,
    /**
     *  #22B39B 100%    主色
     */
    AppColorTypeFontI,
    
    
 
    
    /*---------------------------- 3.APP按钮状态颜色类型 ----------------------------*/
#pragma 按钮分为三种状态:不可点击，正常和按下；一种状态的按钮主要具备的颜色:分别是背景色，边框色和标题色
    /**
     *  按键标题，   字体色 #FFFFFF 100%
     */
    AppColorTypeButtonTitle,
    
    
    
    /**
     *  按键正常状态，背景色 #22B39B 100%
     */
    AppColorTypeButtonStateNormal_StyleA,
    /**
     *  按键高亮状态，背景色 #1B907C 100%
     */
    AppColorTypeButtonStateHighlighted_StyleA,
    /**
     *  按键不可点击，背景色 #B8E4DC 100%
     */
    AppColorTypeButtonStateDisabled_StyleA,
    
    /*---------------------------- 4.课程状态背景颜色类型 ----------------------------*/
    /**
     *  #FFB700 100%    已预约背景色
     */
    AppColorTypeCourseA,
    /**
     *  #FF5C90 100%    待确认背景色
     */
    AppColorTypeCourseB,
    /**
     *  #AEAFAF 100%    已结束背景色
     */
    AppColorTypeCourseC,
};


@interface UIColor (APPColor)

/**
 *  APP设置颜色的方法
 *
 *  @param customColorType 颜色类型
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithCustomType:(AppColorType)customColorType;

@end
