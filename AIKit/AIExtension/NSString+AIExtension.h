

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSString (AIExtension)

- (CGFloat)ai_heightWithFont:(UIFont *)aFont maxWidth:(CGFloat)maxWidth;

- (instancetype)ai_MD5Hash;

-(instancetype)ai_URLEncodingUTF8String;
-(instancetype)ai_URLDecodingUTF8String;


- (instancetype)ai_trimHead;
- (instancetype)ai_trimTail;
- (instancetype)ai_trimBoth;

@end
