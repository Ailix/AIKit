

#import "UIStoryboard+AIExtension.h"

@implementation UIStoryboard (AIExtension)

+ (id)ai_viewControllerByIdentifier:(NSString *)aIdentifier withStoryboard:(NSString *)storyboard
{
    UIStoryboard *storyBoard = [self storyboardWithName:storyboard bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:aIdentifier];
    
    return viewController;
}

+ (id)ai_mainStoryboardViewControllerByIdentifier:(NSString *)identifier
{
    return [self ai_viewControllerByIdentifier:identifier withStoryboard:@"Main"];
}


@end
