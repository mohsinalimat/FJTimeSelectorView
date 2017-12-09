//
//  NSString+DayCount.h
//  MDM
//
//  Created by fjf on 2017/12/7.
//  Copyright © 2017年 MDM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DayCount)
/**
 依据 年份 和 月份 确定 天数
 
 @param year 年份
 @param month 月份
 @return 当前 月份 天数
 */
+(NSInteger)mdm_dayCountWithYear:(NSInteger)year month:(NSInteger)month;

/**
 获取 当前 年份

 @return 当前 年份
 */
+ (NSInteger)mdm_presentYear;
@end
