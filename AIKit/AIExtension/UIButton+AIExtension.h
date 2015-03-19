//
//  UIButton+AIExtension.h
//  UIKitCatalog
//
//  Created by Ailix on 15/3/7.
//  Copyright (c) 2015年 Ailix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AIExtension)

/**
 *  根据按钮状态设置背景色
 *
 *  @param color 需要设置的颜色
 *  @param state 颜色对应的按钮状态
 */
- (void)ai_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
@end
