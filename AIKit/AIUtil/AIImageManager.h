

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AIImageManager : NSObject

/**
 *  获取图片缓存管理的单例
 *
 *  @return 单例对象
 */
+ (id)sharedManager;

/**
 *  图片请求地址对应的图片是否已缓存
 *
 *  @param urlStr 图片请求地址
 *
 *  @return 是否已缓存
 */
- (BOOL)isImageExistWithUrl:(NSString *)urlStr;

/**
 *  获取图片请求地址对应的缓存图片
 *
 *  @param urlStr 图片请求地址
 *
 *  @return 缓存图片对象
 */
- (UIImage *)getImageWithUrl:(NSString *)urlStr;

/**
 *  将图片放入缓存
 *
 *  @param urlStr 图片请求地址
 *  @param aData  图片数据
 */
- (void)saveImageWithUrl:(NSString *)urlStr data:(NSData *)aData;

/**
 *  清空图片缓存
 */
- (void)clearCache;

@end
