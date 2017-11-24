//
//  NSString+Judgment.h
//  2017-1124-NSString-Category
//
//  Created by 007 on 2017/11/24.
//  Copyright © 2017年 wkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Judgment)

/*
 *  除字符串两端的空格,不会去除字符串内部的空格
 *
 *  return 返回格式化后的字符串
 */
- (NSString *)trim;

/**
 *  去除字符串两端的空格和字符串中间的换行
 *
 *  @return 返回格式化后的字符串
 */
- (NSString *)trimmingWhitespaceAndAllNewLine;

/**
 *  手机号码验证，2017年工信部最新文件，3456789均有使用
 *
 *  @return 返回这个字符串是否是手机号格式 YES 代表是手机号 NO 代表不是
 */
- (BOOL) isMobile;

/**
 *  邮箱验证
 *  判断字符串是否是邮箱格式的
 *
 *  @return YES 代表是邮箱格式的 NO 代表不是
 */
- (BOOL) isEmail;

/**
 *  特殊字符验证，判断字符串中是否包含特殊字符
 *
 *  @return YES 代表包含有特殊字符， NO 代表不包含特殊字符
 */
- (BOOL) isSpecialCharacter;

/*
 *  判断字符串是否是空字符串，过滤空格，换行, 无法过滤nil对象
 *
 *  return YES 代表是空串或者nil NO 代表有值
 */
- (BOOL) isEmptyString;

/*
 *  判断字符串是否符合6-12位合法密码
 *
 *  return YES 代表合法 NO 代表不合法
 */
- (BOOL) isLegalPassword;

/**
 *  匹配字符串中的链接
 *
 *  @return 返回链接字符串数组
 */
- (NSArray *) matchLinks;

@end
