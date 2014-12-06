

@import UIKit;

@interface NSString (AIExtension)

- (CGFloat)heightWithFont:(UIFont *)aFont maxWidth:(CGFloat)maxWidth;

@end

@interface NSString(MD5Addition)

- (NSString *) stringFromMD5;

@end