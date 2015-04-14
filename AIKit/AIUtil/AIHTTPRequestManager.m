

#import "AIHTTPRequestManager.h"
@import UIKit;


@interface AIHTTPRequest ()

/** 请求的地址 */
@property (nonatomic,copy)NSString *requestUrl;

/**
 *  开始请求
 */
- (void)startRequest;

@end


@implementation AIHTTPRequest
{
    NSMutableData *_mData;
}

- (void)dealloc
{
    self.finishBlock = nil;
    self.failedBlock = nil;
    self.requestUrl = nil;
    _mData = nil;
}

- (void)startRequest
{
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_requestUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _mData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.finishBlock(_mData);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.failedBlock(error);
}

@end

@implementation AIHTTPRequestManager



+ (id)sharedManager
{
    static AIHTTPRequestManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[AIHTTPRequestManager alloc] init];
    });
    return _sharedManager;
}
- (void)requestWithUrl:(NSString *)urlStr finish:(AIHTTPFinishBlock)aFinishBlock failed:(AIHTTPFailedBlock)aFailedBlock
{
    AIHTTPRequest *request = [[AIHTTPRequest alloc] init];
    request.requestUrl = urlStr;
    request.finishBlock = aFinishBlock;
    request.failedBlock = aFailedBlock;
    [request startRequest];
}
@end
