

#import "AIHTTPRequestManager.h"
#import <UIKit/UIKit.h>
@implementation AIHTTPRequest
{
    NSMutableData *_mData;
}

- (void)dealloc
{
    self.finishBlock = nil;
    self.failedBlock = nil;
    self.requestUrl = nil;
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
//    NSLog(@"error:%@",error);
    self.failedBlock(error);
}

@end

@implementation AIHTTPRequestManager

static AIHTTPRequestManager *g_dataManager = nil;

- (void)dealloc
{
    g_dataManager = nil;
}

+ (id)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (g_dataManager == nil) {
            g_dataManager = [[AIHTTPRequestManager alloc] init];
        }
    });
    return g_dataManager;
}
- (void)requestWithUrl:(NSString *)urlStr finish:(FinishBlock)aFinishBlock failed:(FailedBlock)aFailedBlock
{
    AIHTTPRequest *request = [[AIHTTPRequest alloc] init];
    request.requestUrl = urlStr;
    request.finishBlock = aFinishBlock;
    request.failedBlock = aFailedBlock;
    [request startRequest];
}
@end
