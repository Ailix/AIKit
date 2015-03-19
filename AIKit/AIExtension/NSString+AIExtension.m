//
//  NSString+AIExtension.m
//  SelfPage
//
//  Created by alex on 14/11/24.
//  Copyright (c) 2014年 alex. All rights reserved.
//

#import "NSString+AIExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (AIExtension)

- (CGFloat)ai_heightWithFont:(UIFont *)aFont maxWidth:(CGFloat)maxWidth
{
    if (self.length == 0 || self == nil) {
        return 0.f;
    }
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:aFont} context:nil].size;

    return size.height;
}

- (NSString *)ai_MD5Hash
{
    if(self == nil || [self length] == 0)
        return nil;
    const char *cString = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cString, strlen(cString), result);
    return [NSString stringWithFormat:
                   @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                   result[0], result[1], result[2], result[3],
                   result[4], result[5], result[6], result[7],
                   result[8], result[9], result[10], result[11],
                   result[12], result[13], result[14], result[15]];;
}





-(NSString *)ai_URLEncodingUTF8String{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                             (CFStringRef)self,
                                                                                             NULL,
                                                                                             CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                             kCFStringEncodingUTF8));
    return result;
}

-(NSString *)ai_URLDecodingUTF8String{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                             (CFStringRef)self,
                                                                                                             CFSTR(""),
                                                                                                             kCFStringEncodingUTF8));
    return result;
}


-(NSString *)ai_trimHead
{
    NSInteger i;
    NSCharacterSet *cs = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for(i = 0; i < [self length]; i++)
    {
        if ( ![cs characterIsMember: [self characterAtIndex: i]] ) break;
    }
    return [self substringFromIndex: i];
}

-(NSString *)ai_trimTail
{
    NSInteger i;
    NSCharacterSet *cs = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for(i = [self length] -1; i >= 0; i--)
    {
        if ( ![cs characterIsMember: [self characterAtIndex: i]] ) break;
    }
    return [self substringToIndex: (i+1)];
}

- (NSString *)ai_trimBoth
{
    return [[self ai_trimHead] ai_trimTail];
}



@end
