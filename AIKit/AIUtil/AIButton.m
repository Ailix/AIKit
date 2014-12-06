

#import "AIButton.h"
#define kImageRatio 0.6

@implementation AIButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.layer setOpacity:0.3];
    });
    
}


- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    
    [self performSelector:@selector(setDefault) withObject:nil afterDelay:0.1];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self performSelector:@selector(setDefault) withObject:nil afterDelay:0.1];
}

- (void)setDefault
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.layer setOpacity:1.0];
    });
}





@end
