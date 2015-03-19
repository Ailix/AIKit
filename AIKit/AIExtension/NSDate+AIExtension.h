//
//  NSDate+AIExtension.h
//  NSDate
//
//  Created by Ailix on 15/3/17.
//  Copyright (c) 2015年 Ailix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+AIExtension.h"

@interface NSDate (AIExtension)


/**
 *  根据日期字符串转成日期
 *
 *  @param dateString 日期字符串
 *
 *  @return NSDate实例对象
 */
+ (instancetype)ai_dateFromString:(NSString *)dateString;

/**
 *  根据时间戳获取NSDate对象
 *
 *  @param timeStampString 时间戳
 *
 *  @return NSDate实例对象
 */
+ (instancetype)ai_dateFromTimeStampString:(NSString *)timeStampString ;


/**
 *  NSDate转NSString
 *
 *  @return 日期字符串
 */
- (NSString *)ai_dateString;


/**
 *  时间标签
 *
 *  @return 时间标签字符串
 */
- (NSString *)ai_timeStampString;

@end


@interface NSDate (AIExtensionDeprecated)

+ (NSString *)ai_dateStringFromTimeStampString:(NSString *)timeStampString __deprecated_msg("DO NOT USE");
+ (NSString *)ai_dateStringWithDate:(NSDate *)date DEPRECATED_ATTRIBUTE;

@end


