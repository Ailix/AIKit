//
//  UIColor+AIExtension.h
//  iCandou
//
//  Created by Ailix on 14-11-4.
//  Copyright (c) 2014年 NC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AIExtension)

+ (instancetype)ai_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;
+ (instancetype)ai_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b alpha:(CGFloat)alpha;
+ (instancetype)ai_colorWithRGBHex:(UInt32)hex;
+ (instancetype)ai_colorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;

/**
 *  获取随机颜色
 *
 *  @return 随机颜色实例
 */
+ (instancetype)ai_randomColor;


/** Return the red, green or blue components of the color. */

- (CGFloat)ai_red;

- (CGFloat)ai_green;

- (CGFloat)ai_blue;

/** Return the alpha value of the color. */

- (CGFloat)ai_alpha;

@end
