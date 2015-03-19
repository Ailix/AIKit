//
//  AITranslucentLabelBuilder.h
//  AITranslucentLabel
//
//  Created by Ailix on 15/3/12.
//  Copyright (c) 2015年 Ailix. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;
@class AITranslucentLabel;

@interface AITranslucentLabelBuilder : NSObject

/** 文本 */
@property (nonatomic,copy  ) NSString        *text;

/** 字体 */
@property (nonatomic,strong) UIFont          *font;

/** 文本颜色 */
@property (nonatomic,strong) UIColor         *textColor;

/** 对齐方式 */
@property (nonatomic       ) NSTextAlignment textAlignment;

/** 透明度 */
@property (nonatomic       ) CGFloat         alphaValue;

@property (nonatomic       ) CGRect          frame;

/**
 *  构造器检查属性
 *
 *  @return AITranslucentLabel实例对象
 */
- (AITranslucentLabel *)build;

@end
