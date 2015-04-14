

#import <Foundation/Foundation.h>

typedef void(^AIHTTPFinishBlock)(NSData *data);
typedef void(^AIHTTPFailedBlock)(NSError *error);


@interface AIHTTPRequest : NSObject<NSURLConnectionDataDelegate>


/** 请求成功的代码块 */
@property (nonatomic,copy)AIHTTPFinishBlock finishBlock;

/** 请求失败的代码块 */
@property (nonatomic,copy)AIHTTPFailedBlock failedBlock;

@end

@interface AIHTTPRequestManager : NSObject
/**
 *  获得请求管理的单例
 *
 *  @return 单例对象
 */
+ (id)sharedManager;

/**
 *  发送HTTP请求
 *
 *  @param urlStr       请求地址
 *  @param aFinishBlock 请求成功的代码块
 *  @param aFailedBlock 请求失败的代码块
 */
- (void)requestWithUrl:(NSString *)urlStr finish:(AIHTTPFinishBlock)aFinishBlock failed:(AIHTTPFailedBlock)aFailedBlock;

@end
