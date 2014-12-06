

#import "UIStoryboard+AIExtension.h"

@implementation UIStoryboard (AIExtension)

+ (id)viewControllerByIdentifier:(NSString *)aIdentifier withStoryboard:(NSString *)aStoryboard
{
    UIStoryboard *storyBoard = [self storyboardWithName:aStoryboard bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:aIdentifier];
    
    return viewController;
}

+ (id)mainStoryboardViewControllerByIdentifier:(NSString *)aIdentifier
{
    return [self viewControllerByIdentifier:aIdentifier withStoryboard:@"Main"];
}


@end
