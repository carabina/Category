//
//  NSString+Judgment.m
//  2017-1124-NSString-Category
//
//  Created by 007 on 2017/11/24.
//  Copyright © 2017年 wkj. All rights reserved.
//

#import "NSString+Judgment.h"

@implementation NSString (Judgment)

// 去除字符串两端的空格
- (NSString *)trim{
    
    NSString *temp = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    temp = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return temp;
}

// 去除字符串 两端空白 和所有的换行
-(NSString *)trimmingWhitespaceAndAllNewLine
{
    NSString *temp = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    temp = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    return temp;
}

// 判断字符串是否是手机号
- (BOOL) isMobile{
    NSString *pattern = @"^1+[3456789]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

// 判断字符串是否符合邮箱格式
- (BOOL) isEmail{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if ([emailTest evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

// 判断是否是特殊字符
- (BOOL) isSpecialCharacter{
    
    NSString *specialCharacter = @"[a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", specialCharacter];
    
    if (![pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

// 判断字符串是否是空字符串，过滤空格，换行
- (BOOL) isEmptyString{
    
    NSString *trimmingString = [self trimmingWhitespaceAndAllNewLine];
    
    if ([trimmingString isEqualToString:@""] || !trimmingString ) {
        return YES;
    }
    
    return NO;
}

// 判断字符串是否是合法密码
- (BOOL)isLegalPassword{
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,12}+$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:self];
}

// 匹配字符串中得链接
- (NSArray *) matchLinks{
    
    NSError *error;
    
    NSString *regulaStr = @"(http|ftp|https)://[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:/~+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSMutableArray *urls = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSString* substringForMatch = [self substringWithRange:match.range];
        [urls addObject:substringForMatch];
    }
    
    return urls;
}

@end
