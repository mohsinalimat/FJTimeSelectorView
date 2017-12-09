//
//  UIColor+APPColor.m
//  DeJiaIM
//
//  Created by xianjb on 2016/11/2.
//  Copyright © 2016年 tsningning. All rights reserved.
//

#import "UIColor+APPColor.h"


// 十六进制RGB颜色 格式为（0xffffff）
#define ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


@implementation UIColor (APPColor)

+ (UIColor *)colorWithCustomType:(AppColorType)customColorType
{
    UIColor *color = nil;
    
    switch (customColorType) {
            /**************************** 1.APP主题颜色类型 ****************************/
            /**
             *  #22B39B 100%    主色，浅绿色
             */
        case AppColorTypeA:
            color = ColorFromRGB(0x22B39B);
            break;
            /**
             *  #20A58E 100%    搜索框颜色，深绿色
             */
        case AppColorTypeB:
            color = ColorFromRGB(0x20A58E);
            break;
            /**
             *  #EFF1F2 100%    线条分割色
             */
        case AppColorTypeC:
            color = ColorFromRGB(0xEFF1F2);
            break;
            /**
             *  #FBFBFB 100%    背景色，灰白
             */
        case AppColorTypeD:
            color = ColorFromRGB(0xFBFBFB);
            break;
            /**
             *  #1D1D20 60%     蒙版色
             */
        case AppColorTypeE:
            color = ColorFromRGBA(0x1D1D20, 0.6);
            break;
            /**
             *  #22B39B 50%     主色阴影
             */
        case AppColorTypeF:
            color = ColorFromRGBA(0x22B39B, 0.5);
            break;
            /**
             *  #FF5C90 100%     消息提示背景色
             */
        case AppColorTypeG:
            color = ColorFromRGBA(0xFF5C90, 1);
            break;
            /**
             *  #FFFFFF 100%    背景色，纯白
             */
        case AppColorTypeH:
            color = ColorFromRGBA(0xFFFFFF, 1);
            break;

            
            /**************************** 2.APP字体颜色类型 ****************************/
            /**
             *  #FFFFFF 100%    导航
             */
        case AppColorTypeFontA:
            color = ColorFromRGB(0xFFFFFF);
            break;
            /**
             *  #292B2A 100%    特大标题/提醒，深黑
             */
        case AppColorTypeFontB:
            color = ColorFromRGB(0x292B2A);
            break;
            /**
             *  #505251 100%    主标题
             */
        case AppColorTypeFontC:
            color = ColorFromRGB(0x505251);
            break;
            /**
             *  #666666 100%    内容/评论内容
             */
        case AppColorTypeFontD:
            color = ColorFromRGB(0x666666);
            break;
            /**
             *  #AEAFAF 100%    次要内容
             */
        case AppColorTypeFontE:
            color = ColorFromRGB(0xAEAFAF);
            break;
            /**
             *  #DBDBDB 100%    提示内容
             */
        case AppColorTypeFontF:
            color = ColorFromRGB(0xDBDBDB);
            break;
            /**
             *  #6DC9B9 100%    首页导航，浅绿
             */
        case AppColorTypeFontG:
            color = ColorFromRGB(0x6DC9B9);
            break;
            /**
             *  #B8E4DC 100%    不可点击按钮，淡绿
             */
        case AppColorTypeFontH:
            color = ColorFromRGB(0xB8E4DC);
            break;
            /**
             *  #22B39B 100%    主色
             */
        case AppColorTypeFontI:
            color = ColorFromRGB(0x22B39B);
            break;
            
            
            /**************************** 3.APP按钮状态颜色类型 ****************************/
#pragma 按钮分为三种状态:不可点击，正常和按下；一种状态的按钮主要具备的颜色:分别是背景色，边框色和标题色
            /**
             *  按键标题，   字体色 #FFFFFF 100%
             */
        case AppColorTypeButtonTitle:
            color = ColorFromRGB(0xFFFFFF);
            break;
            
            
            
            /**
             *  按键正常状态，背景色 #22B39B 100%
             */
        case AppColorTypeButtonStateNormal_StyleA:
            color = ColorFromRGB(0x22B39B);
            break;
            /**
             *  按键高亮状态，背景色 #1B907C 100%
             */
        case AppColorTypeButtonStateHighlighted_StyleA:
            color = ColorFromRGB(0x1B907C);
            break;
            /**
             *  按键不可点击，背景色 #B8E4DC 100%
             */
        case AppColorTypeButtonStateDisabled_StyleA:
            color = ColorFromRGB(0xB8E4DC);
            break;
            
            
            /*------------------------ 4.课程状态背景颜色类型 ----------------------*/
            /**
             *  #FFB700 100%    已预约背景色
             */
        case AppColorTypeCourseA:
            color = ColorFromRGB(0xFFB700);
            break;
            /**
             *  #FF5C90 100%    待确认背景色
             */
        case AppColorTypeCourseB:
            color = ColorFromRGB(0xFF5C90);
            break;
            /**
             *  #AEAFAF 100%    已结束背景色
             */
        case AppColorTypeCourseC:
            color = ColorFromRGB(0xAEAFAF);
            break;
            
        default:
            break;
    }
    
    return color;
}

@end
