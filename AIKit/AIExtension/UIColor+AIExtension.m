//
//  UIColor+AIExtension.m
//  iCandou
//
//  Created by Ailix on 14-11-4.
//  Copyright (c) 2014年 NC. All rights reserved.
//

#import "UIColor+AIExtension.h"



@implementation UIColor (AIExtension)


+ (UIColor *)ai_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b
{
    return [self ai_colorWithR:r G:g B:b alpha:1.];
}

+ (UIColor *)ai_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b alpha:(CGFloat)alpha
{
    CGFloat red   = r/0xFF;
    CGFloat green = g/0xFF;
    CGFloat blue  = b/0xFF;
    
    return [self colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)ai_colorWithRGBHex:(UInt32)hex
{
    
    return [self ai_colorWithRGBHex:hex alpha:1.];
}

+ (UIColor *)ai_colorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [self ai_colorWithR:r G:g B:b alpha:alpha];
}

+ (UIColor *)ai_randomColor
{
    NSInteger r = arc4random_uniform(255);
    NSInteger g = arc4random_uniform(255);
    NSInteger b = arc4random_uniform(255);
    
    return [self ai_colorWithR:r G:g B:b];
}


/** Return the color space object associated with the color. */

- (CGColorSpaceRef)ai_colorSpace
{
    return CGColorGetColorSpace(self.CGColor);
}

- (CGColorSpaceModel)ai_colorSpaceModel
{
    return CGColorSpaceGetModel([self ai_colorSpace]);
}

/** Return the color components (including alpha). */

- (const CGFloat *)ai_components
{
    return CGColorGetComponents(self.CGColor);
}

/** Return the number of color components (including alpha). */

- (size_t)ai_numberOfComponents
{
    return CGColorGetNumberOfComponents(self.CGColor);
}




- (CGFloat)ai_red {
    return [self ai_components][0];
}


- (CGFloat)ai_green {
    if ([self ai_colorSpaceModel] == kCGColorSpaceModelMonochrome) {
       return [self ai_components][0];
    }
    
    return [self ai_components][1];

}


- (CGFloat)ai_blue {
    if ([self ai_colorSpaceModel] == kCGColorSpaceModelMonochrome) {
        return [self ai_components][0];
    }
    return [self ai_components][2];
}


- (CGFloat)ai_alpha {
    return CGColorGetAlpha(self.CGColor);
}



@end
