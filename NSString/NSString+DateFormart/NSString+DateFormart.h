//
//  NSString+DateFormart.h
//  2017-1124-NSString-Category
//
//  Created by 007 on 2017/11/27.
//  Copyright © 2017年 wkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateFormart)

#pragma mark - 根据当前系统时间，获取不同格式的时间字符串

/**
 *  按照标准格式 ：yyyy-MM-dd HH:mm:ss 格式化当前时间
 *
 *  @return 返回经过标准格式化当前时间后的字符串日期
 */
+ (NSString *)standardFormartCurrentDate;

//
/**
 *  按照标准格式 ：YYYY-MM 格式化当前时间
 *
 *  @return 返回经过标准格式化当前时间后的字符串日期
 */
+ (NSString *)dateFormartByYYYY_Month;

/**
 *  根据传入的时间的毫秒值，按照yyyy-MM-dd HH:mm:ss标准 返回一个格式化后的时间字符串
 *
 *  @param timeInterval 时间毫秒值
 *
 *  @return 返回一个格式化后的时间字符串
 */
+ (NSString *)standardFormartWithTimeInterval:(NSNumber *) timeInterval;

#pragma mark - 将不同格式的时间字符串，格式化为其他格式的时间字符串

/**
 *  将字符串按照标准格式化标准 格式化为时间字符串，传入的时间字符串支持yyyy-MM-dd HH:mm:ss 和 yyyy-MM-dd 
 *
 *  @return 返回格式化后的时间字符串，格式为yyyy-MM-dd HH:mm:ss
 */
- (NSString *)dateFormartByStandard;

/**
 *  将字符串按照 yyyy-MM-dd 格式 格式化为日期字符串，传入的时间字符串支持yyyy-MM-dd HH:mm:ss 和 yyyy-MM-dd
 *
 *  @return 返回格式化后的时间字符串，格式为yyyy-MM-dd 
 */
- (NSString *)dateFormartByYYYY_MM_dd;

/**
 *  将字符串按照 MM月dd日 HH:mm:ss 格式 格式化为日期字符串，传入的时间字符串支持yyyy-MM-dd HH:mm:ss 和 yyyy-MM-dd
 *
 *  @return 返回格式化后的时间字符串，格式为MM月dd日 HH:mm:ss
 */
- (NSString *)dateFormartByMM_Month_dd_day_HH_mm_ss;

/**
 *  将字符串按照 MM-dd HH:mm 格式 格式化为日期字符串
 *
 *  @return 返回格式化后的时间字符串
 */
- (NSString *)dateFormartByMM_dd_HH_mm;

/**
 *  格式化时间字符串为 多久前
 *
 *  @return 返回刚刚，多少分钟前，多少天前，或者几月几号
 */
- (NSString *)formatterDateStringForHowLong;

@end
