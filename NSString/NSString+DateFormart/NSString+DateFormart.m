//
//  NSString+DateFormart.m
//  2017-1124-NSString-Category
//
//  Created by 007 on 2017/11/27.
//  Copyright © 2017年 wkj. All rights reserved.
//

#import "NSString+DateFormart.h"

@implementation NSString (DateFormart)

// yyyy-MM-dd HH:mm:ss

+ (NSString *)standardFormartCurrentDate{
    
    return _formartDate(@"yyyy-MM-dd HH:mm:ss" , [NSDate date]);
}

// YYYY-MM
+ (NSString *)dateFormartByYYYY_Month{
    
    return _formartDate(@"yyyy-MM" , [NSDate date]);
}

// 根据传入的时间的毫秒值，按照yyyy-MM-dd HH:mm:ss 返回一个格式化后的时间字符串
+ (NSString *)standardFormartWithTimeInterval:(NSNumber *) timeInterval{
    
    return _formartDate(@"yyyy-MM-dd HH:mm:ss" , [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]]);
}

// yyyy-MM-dd HH:mm:ss
- (NSString *)dateFormartByStandard{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    if (self.length > 10) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    NSDate *date = [formatter dateFromString:self];
    
    return _formartDate(@"yyyy-MM-dd HH:mm:ss" , date);
}

// yyyy-MM-dd

- (NSString *)dateFormartByYYYY_MM_dd{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    if (self.length > 10) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    NSDate *date = [formatter dateFromString:self];
    
    formatter.dateFormat = @"yyyy-MM-dd";
    
    return _formartDate(@"yyyy-MM-dd" , date);
}

// MM月dd日 HH:mm:ss

- (NSString *)dateFormartByMM_Month_dd_day_HH_mm_ss{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    if (self.length > 10) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    NSDate *date = [formatter dateFromString:self];
    
    return _formartDate(@"MM月dd日 HH:mm:ss" , date);
}

// MM-dd HH:mm
- (NSString *)dateFormartByMM_dd_HH_mm{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    if (self.length > 10) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    NSDate *date = [formatter dateFromString:self];
    
    return _formartDate(@"MM-dd HH:mm" , date);
}

// 格式化时间字符串为 多久前
-(NSString *)formatterDateStringForHowLong;
{
    if (!self) {
        return @"刚刚";
    }
    
    //格式化 时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat : @"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:self];
    
    if (!date) {
        return @"刚刚";
    }
    
    //创建时间
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] componentsInTimeZone:[NSTimeZone localTimeZone] fromDate:date];
    //当前时间
    NSDateComponents *currentComponents = [[NSCalendar currentCalendar] componentsInTimeZone:[NSTimeZone localTimeZone] fromDate:[NSDate new]];
    
    //判断年是否相同
    if (dateComponents.year != currentComponents.year) {
        [formatter setDateFormat : @"YY-MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
    
    //判断月是否相同
    if (dateComponents.month != currentComponents.month) {
        [formatter setDateFormat : @"MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
    
    //判断日是否相同
    if (dateComponents.day != currentComponents.day) {
        return [NSString stringWithFormat:@"%ld天前",(long)currentComponents.day-dateComponents.day];
    }
    
    //判断时是否相同
    if (dateComponents.hour != currentComponents.hour) {
        return [NSString stringWithFormat:@"%ld小时前",(long)currentComponents.hour-dateComponents.hour];
    }
    
    //判断分是否相同
    if (dateComponents.minute != currentComponents.minute) {
        return [NSString stringWithFormat:@"%ld分钟前",(long)currentComponents.minute-dateComponents.minute];
    }
    
    return @"刚刚";
}

#pragma mark - private method

NSString * _formartDate(NSString *formartString , NSDate *formartDate){
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:formartString];
    
    return [formatter stringFromDate:formartDate];
}


@end
