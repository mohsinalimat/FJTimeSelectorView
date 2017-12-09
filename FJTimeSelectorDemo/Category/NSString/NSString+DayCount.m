//
//  NSString+DayCount.m
//  MDM
//
//  Created by fjf on 2017/12/7.
//  Copyright © 2017年 MDM. All rights reserved.
//

#import "NSString+DayCount.h"

@implementation NSString (DayCount)

// 依据 年份 和 月份 确定 天数

+(NSInteger)mdm_dayCountWithYear:(NSInteger)year month:(NSInteger)month {
    NSInteger dayCount;
    switch (month) {
        case 1:
            dayCount = 31;
            break;
        case 2:
            if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
                dayCount = 29;
            }else{
                dayCount = 28;
            }
            break;
        case 3:
            dayCount = 31;
            break;
        case 4:
            dayCount = 30;
            break;
        case 5:
            dayCount = 31;
            break;
        case 6:
            dayCount = 30;
            break;
        case 7:
            dayCount = 31;
            break;
        case 8:
            dayCount = 31;
            break;
        case 9:
            dayCount = 30;
            break;
        case 10:
            dayCount = 31;
            break;
        case 11:
            dayCount = 30;
            break;
        default:
            dayCount = 31;
            break;
    }
    return dayCount;
    
}

//获取当前时间
+ (NSInteger)mdm_presentYear {
    NSDate *now = [NSDate date];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];

    return [dateComponent year];
}


@end
