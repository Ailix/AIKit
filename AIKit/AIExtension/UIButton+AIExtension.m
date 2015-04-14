

#import "UIButton+AIExtension.h"

@implementation UIButton (AIExtension)


- (void)ai_setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[self.class ai_imageWithColor:color] forState:state];
}


+ (UIImage *)ai_imageWithColor:(UIColor *)color
{
    
    CGRect rect = CGRectMake(0., 0., 1., 1.);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
