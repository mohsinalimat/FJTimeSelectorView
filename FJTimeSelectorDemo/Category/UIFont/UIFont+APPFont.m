//
//  UIFont+APPFont.m
//  DeJiaIM
//
//  Created by xianjb on 2016/11/2.
//  Copyright © 2016年 tsningning. All rights reserved.
//

#import "UIFont+APPFont.h"

@implementation UIFont (APPFont)

+ (UIFont *)monospacedDigitFontWithCustomType:(AppFontType)customFontType {
    
    UIFont *font = [UIFont fontWithCustomType:customFontType];
    UIFont *monospacedDigitFont = nil;
    if (@available(iOS 9.0, *)) {
        monospacedDigitFont = [UIFont monospacedDigitSystemFontOfSize:font.pointSize weight:UIFontWeightSemibold];
    } else {
        // Fallback on earlier versions
        monospacedDigitFont = [UIFont fontWithName:@"Helvetica Neue" size:font.pointSize];
    }
    return monospacedDigitFont;
}

+ (UIFont *)fontWithCustomType:(AppFontType)customFontType {
    return [UIFont fontWithCustomType:customFontType weightType:AppFontWeightTypeRegular scale:1.0];
}

+ (UIFont *)fontWithCustomType:(AppFontType)customFontType weightType:(AppFontWeightType)weightType {
    return [UIFont fontWithCustomType:customFontType weightType:weightType scale:1.0];
}

+ (UIFont *)fontWithCustomType:(AppFontType)customFontType scale:(CGFloat)scale {
    return [UIFont fontWithCustomType:customFontType weightType:AppFontWeightTypeMedium scale:scale];
}

+ (UIFont *)fontWithCustomType:(AppFontType)customFontType weightType:(AppFontWeightType)weightType scale:(CGFloat)scale {
    
    NSString *fontName = nil;
    UIFont   *font = nil;
    CGFloat  fontSize = 14.0f;
    
    if (@available(iOS 9.0, *)) {
        fontName = @"PingFangSC";
    } else {
        fontName = @"HelveticaNeue";
    }
    
    switch (weightType) {
        case AppFontWeightTypeRegular:
            if (@available(iOS 9.0, *)) {
                fontName = [fontName stringByAppendingString:@"-Regular"];
            }
            break;
        case AppFontWeightTypeLight:
            fontName = [fontName stringByAppendingString:@"-Light"];
            break;
        case AppFontWeightTypeMedium:
            fontName = [fontName stringByAppendingString:@"-Medium"];
            break;
        case AppFontWeightTypeSemibold:
            if ([UIDevice currentDevice].systemVersion.floatValue < 9.0) {
                fontName = [fontName stringByAppendingString:@"-Bold"];
            } else {
                fontName = [fontName stringByAppendingString:@"-Semibold"];
            }
            break;
        case AppFontWeightTypeDINAitemateBold:
            fontName = @"DINAlternate-Bold";
            break;
            
        default:
            if (@available(iOS 9.0, *)) {
                fontName = [fontName stringByAppendingString:@"-Regular"];
            }
            break;
    }
    
    
    switch (customFontType) {
            /**************************** 1.默认字体 ****************************/
            /**
             *  18pt 特大标题/提示语
             */
        case AppFontTypeA:
            fontSize = 18;
            break;
            /**
             *  17pt
             */
        case AppFontTypeB:
            fontSize = 17;
            break;
            /**
             *  16pt 按钮
             */
        case AppFontTypeC:
            fontSize = 16;
            break;
            /**
             *  15pt 课程详情标题/标题
             */
        case AppFontTypeD:
            fontSize = 15;
            break;
            /**
             *  14pt 主标题/输入状态，提示/内容
             */
        case AppFontTypeE:
            fontSize = 14;
            break;
            /**
             *  13pt 内容，次级内容展示/提示
             */
        case AppFontTypeF:
            fontSize = 13;
            break;
            /**
             *  12pt 小标题/提示
             */
        case AppFontTypeG:
            fontSize = 12;
            break;
            /**
             *  11pt 时间/次级内容/次级提示
             */
        case AppFontTypeH:
            fontSize = 11;
            break;
            /**
             *  10pt 标签/名字内容
             */
        case AppFontTypeI:
            fontSize = 10;
            break;
            
            
            /**************************** 2.数字字体 ****************************/
            
            // ****** PingFangSC-Regular ****** //
            /**
             *  18pt 课程详情价钱数字字体
             */
        case AppNumFontTypeA:
            fontName = @"DINAlternate-Bold";
            fontSize = 18;
            break;
            /**
             *  14pt cell中提示文本
             */
        case AppNumFontTypeB:
            fontName = @"DINAlternate-Bold";
            fontSize = 14;
            break;
            /**
             *  10pt cell中提示更新
             */
        case AppNumFontTypeC:
            fontName = @"DINAlternate-Bold";
            fontSize = 10;
            break;
            
            
            /**************************** 3.粗体字体 ****************************/
            /**
             *  18pt 
             */
        case AppBoldFontTypeA:
            fontName = @"PingFangSC-Semibold";
            fontSize = 18;
            break;
            
        default:
            break;
    }
    
    font = [UIFont fontWithName:fontName size:fontSize * scale];
    
    return font;
}

@end
