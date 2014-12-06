

#import "AIImageManager.h"
#import "NSString+AIExtension.h"

@implementation AIImageManager
{
    NSString *_imageCachePath;
}
static AIImageManager *g_imageManager = nil;
+ (id)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (g_imageManager == nil) {
            g_imageManager = [[AIImageManager alloc] init];
        }
    });
    return g_imageManager;
}
- (id)init
{
    self = [super init];
    if (self) {
        _imageCachePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/imageCache/"];
//        NSLog(@"%@",_imageCachePath);
        if (![[NSFileManager defaultManager] fileExistsAtPath:_imageCachePath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:_imageCachePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return self;
}
- (BOOL)isImageExistWithUrl:(NSString *)urlStr
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[_imageCachePath stringByAppendingString:[urlStr stringFromMD5]]];
}
- (UIImage *)getImageWithUrl:(NSString *)urlStr
{
    return [UIImage imageWithContentsOfFile:[_imageCachePath stringByAppendingString:[urlStr stringFromMD5]]];
}
- (void)saveImageWithUrl:(NSString *)urlStr data:(NSData *)aData
{
    [aData writeToFile:[_imageCachePath stringByAppendingString:[urlStr stringFromMD5]] atomically:YES];
}
- (void)clearCache
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *array = [fm contentsOfDirectoryAtPath:_imageCachePath error:nil];
    for (NSString *item in array) {
        [fm removeItemAtPath:[_imageCachePath stringByAppendingString:item] error:nil];
    }
}
@end
