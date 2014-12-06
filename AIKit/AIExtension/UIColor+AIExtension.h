

#import <UIKit/UIKit.h>

@interface UIColor (AIExtension)

+ (UIColor *)colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;
+ (UIColor *)colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;

@end
