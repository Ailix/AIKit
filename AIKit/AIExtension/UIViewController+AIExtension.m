

#import "UIViewController+AIExtension.h"
#import <objc/runtime.h>


@implementation UIViewController (AIExtension)


- (void)setStatusBarHidden:(BOOL)statusBarHidden
{
    objc_setAssociatedObject(self, @selector(statusBarHidden), [NSNumber numberWithBool:statusBarHidden], OBJC_ASSOCIATION_ASSIGN);
    [self setNeedsStatusBarAppearanceUpdate];
    
}

- (BOOL)statusBarHidden
{
    return [objc_getAssociatedObject(self, @selector(statusBarHidden)) boolValue];
}




- (void)ai_pushViewController:(UIViewController *)viewController
{
    UIViewController* current= self.navigationController ? : self;
    UIViewController* next=viewController;
    
    UIGraphicsBeginImageContextWithOptions(current.view.bounds.size, YES, 2.0f);
    [current.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *desImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView* iView = [[UIImageView alloc] initWithImage:desImage];
    
    float width=next.view.frame.size.width;
    float height=next.view.frame.size.height;
    
    [iView setFrame:CGRectMake(-width, 0, width, height)];
    [next.view addSubview:iView];
    next.view.hidden=YES;
    
    [current presentViewController:next animated:NO completion:^(void){
        next.view.center=CGPointMake(width*1.5,height/2);
        next.view.hidden=NO;
        [UIView animateWithDuration:0.5 animations:^(void){
            next.view.center=CGPointMake(width/2,height/2);
        }completion:^(BOOL finished){
            
            [iView removeFromSuperview];
            [current removeFromParentViewController];
            
        }];
    }];
  
}


@end
