//
//  NSDateFormatter+AIExtension.h
//  NSDate
//
//  Created by Ailix on 15/3/17.
//  Copyright (c) 2015年 Ailix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (AIExtension)

/**
 *  NSDateFormatter单例
 *
 *  @return 单例实例对象
 */
+ (instancetype)ai_sharedFormmatter;


/**
 *  根据格式生成NSDateFormatter对象
 *
 *  @param dateFormat 日期格式
 *
 *  @return 特定格式的NSDateFormatters实例对象
 */
+ (instancetype)ai_dateFormatterWithFormat:(NSString *)dateFormat;


/**
 *  默认格式的NSDateFormatter对象
 *
 *  @return 特定格式的NSDateFormatters实例对象
 */
+ (instancetype)ai_defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/


@end
