//
//  AIPageControl.m
//  Test03
//
//  Created by Ailix on 14-7-9.
//  Copyright (c) 2014年 NC. All rights reserved.
//

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

- (void)setImagePageStateHighlighted:(UIImage *)image {
   
    _imagePageStateHighlighted = image;
    [self updateDots];
}

- (void)setImagePageStateNormal:(UIImage *)image {
   
    _imagePageStateNormal = image ;
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

- (void)updateDots {
    
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
