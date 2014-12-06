

#import "AIPageControl.h"


@implementation AIPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}


- (void)dealloc { // 释放内存
    self.imagePageStateNormal = nil;
    self.imagePageStateHighlighted = nil;
}

- (void)setImagePageStateHighlighted:(UIImage *)image {  // 设置正常状态点按钮的图片
    _imagePageStateHighlighted = image;
    [self updateDots];
}

- (void)setImagePageStateNormal:(UIImage *)image { // 设置高亮状态点按钮图片
    _imagePageStateNormal = image;
    [self updateDots];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event { // 点击事件
    [super endTrackingWithTouch:touch withEvent:event];
    [self updateDots];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    [self updateDots];
}



- (void)updateDots { // 更新显示所有的点按钮
    
    if (_imagePageStateNormal || _imagePageStateHighlighted)
    {
        CGSize size = _imagePageStateHighlighted.size;
        int i = 0;
        for (UIView *view in self.subviews) {
            if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending) {
                view.bounds = CGRectMake(0, 0, size.width, size.height);
                view.backgroundColor = self.currentPage == i++ ? [UIColor colorWithPatternImage:_imagePageStateHighlighted] : [UIColor colorWithPatternImage:_imagePageStateNormal];
            }
            else
            {
                view.bounds = CGRectMake(0, 0, size.width, size.height + 4);
                UIImageView *imageView = (UIImageView *)view;
                imageView.image = self.currentPage == i ++ ? _imagePageStateHighlighted : _imagePageStateNormal;
            }
        }
    }
}


@end
