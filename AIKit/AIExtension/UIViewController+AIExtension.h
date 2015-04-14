

#import <UIKit/UIKit.h>

@interface UIViewController (AIExtension)

@property (nonatomic,assign) BOOL statusBarHidden;


/** A推向B 同时A释放 */
- (void)ai_pushViewController:(UIViewController *)viewController;


@end
