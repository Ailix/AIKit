

#import <UIKit/UIKit.h>

@interface UIStoryboard (AIExtension)

+ (id)mainStoryboardViewControllerByIdentifier:(NSString *)aIdentifier;

+ (id)viewControllerByIdentifier:(NSString *)aIdentifier withStoryboard:(NSString *)aStoryboard;


@end
