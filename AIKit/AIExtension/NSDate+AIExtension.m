
#import "NSDate+AIExtension.h"
#import "NSDateFormatter+AIExtension.h"



@implementation NSDate (AIExtension)


+ (instancetype)ai_dateFromString:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [NSDateFormatter ai_defaultDateFormatter];
    return [dateFormatter dateFromString:dateString];
}

+ (instancetype)ai_dateFromTimeStampString:(NSString *)timeStampString
{
    NSTimeInterval totalSeconds = [timeStampString doubleValue];
    NSDate  *date = [self dateWithTimeIntervalSince1970:totalSeconds];
    return date;
}


- (NSString *)ai_dateString
{
    NSDateFormatter *dateFormatter = [NSDateFormatter ai_defaultDateFormatter];
    return [dateFormatter stringFromDate:self];
}


- (double)ai_timeStamp
{
    return floor([self timeIntervalSince1970]);
}

- (NSString *)ai_timeStampString
{
    return [NSString stringWithFormat:@"%d",(int)[self ai_timeStamp]];
}

@end

@implementation NSDate (AIExtensionDeprecated)

+ (NSString *)ai_dateStringFromTimeStampString:(NSString *)timeStampString
{
    //    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    //    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    NSDate  *date = [self ai_dateFromTimeStampString:timeStampString];
    NSDateFormatter *dateFormatter = [NSDateFormatter ai_defaultDateFormatter];
    
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)ai_dateStringWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [NSDateFormatter ai_defaultDateFormatter];
    return [dateFormatter stringFromDate:date];
}

@end


