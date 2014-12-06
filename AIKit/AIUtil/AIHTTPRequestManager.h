

#import <Foundation/Foundation.h>

typedef void(^FinishBlock)(NSData *data);
typedef void(^FailedBlock)(NSError *error);


@interface AIHTTPRequest : NSObject<NSURLConnectionDataDelegate>
/**
 *  开始请求
 */
- (void)startRequest;

@property (nonatomic,copy)NSString *requestUrl;//请求的地址
@property (nonatomic,copy)FinishBlock finishBlock;//请求成功的代码块
@property (nonatomic,copy)FailedBlock failedBlock;//请求失败的代码块
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
- (void)requestWithUrl:(NSString *)urlStr finish:(FinishBlock)aFinishBlock failed:(FailedBlock)aFailedBlock;

@end
