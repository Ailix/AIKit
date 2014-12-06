

#import "NSString+AIExtension.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (AIExtension)

- (CGFloat)heightWithFont:(UIFont *)aFont maxWidth:(CGFloat)maxWidth
{
    if (self.length == 0 || self == nil) {
        return 0.0f;
    }
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:aFont} context:nil].size;

    return size.height;
}

@end

#if __has_feature(objc_arc)
#define SAFE_AUTORELEASE(a) (a)
#else
#define SAFE_AUTORELEASE(a) [(a) autorelease]
#endif
@implementation NSString(MD5Addition)

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return SAFE_AUTORELEASE(outputString);
}

@end