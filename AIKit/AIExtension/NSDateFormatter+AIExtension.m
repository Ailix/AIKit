//
//  NSDateFormatter+AIExtension.m
//  NSDate
//
//  Created by Ailix on 15/3/17.
//  Copyright (c) 2015年 Ailix. All rights reserved.
//

#import "NSDateFormatter+AIExtension.h"

@implementation NSDateFormatter (AIExtension)


+ (instancetype)ai_sharedFormmatter
{
    static NSDateFormatter *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}


+ (instancetype)ai_dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [self ai_sharedFormmatter];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (instancetype)ai_defaultDateFormatter
{
    return [self ai_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
@end
