

#import <UIKit/UIKit.h>

@interface UIStoryboard (AIExtension)

+ (id)ai_mainStoryboardViewControllerByIdentifier:(NSString *)identifier;

+ (id)ai_viewControllerByIdentifier:(NSString *)aIdentifier withStoryboard:(NSString *)storyboard;


@end
