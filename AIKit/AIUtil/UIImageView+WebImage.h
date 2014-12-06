

#import <UIKit/UIKit.h>

@interface UIImageView (WebImage)

- (void)setImageWithUrl:(NSString *)urlStr;
- (void)setImageWithUrl:(NSString *)urlStr placeholder:(UIImage *)aPlaceholder;

@end
