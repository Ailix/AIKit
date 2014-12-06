

#import "UIImageView+WebImage.h"
#import "AIImageManager.h"
#import "AIHTTPRequestManager.h"

@implementation UIImageView (WebImage)
- (void)setImageWithUrl:(NSString *)urlStr
{
    [self setImageWithUrl:urlStr placeholder:nil];
}
- (void)setImageWithUrl:(NSString *)urlStr placeholder:(UIImage *)aPlaceholder
{
    if ([urlStr isEqualToString:@""]) {
//        NSLog(@"无图片");
        self.image = aPlaceholder;
        return;
    }
    self.image = aPlaceholder;
    AIImageManager *im = [AIImageManager sharedManager];
    if ([im isImageExistWithUrl:urlStr]) {
        self.image = [im getImageWithUrl:urlStr];
        if (self.image == nil) {
            self.image = aPlaceholder;
        }
    }
    else
    {
    [[AIHTTPRequestManager sharedManager] requestWithUrl:urlStr finish:^(NSData *data) {
        /*
        UIImage *image = [UIImage imageWithData:data];
        image = [Tool changeSizeOfImgKeepScale:image andMaxLength:self.bounds.size.width andMaxHeight:self.bounds.size.height];
        self.image = image;
        */
        self.image = [UIImage imageWithData:data];
        [[AIImageManager sharedManager] saveImageWithUrl:urlStr data:data];
    } failed:^(NSError *error) {
        NSLog(@"图片请求错误");
    }];
    }
}
@end
