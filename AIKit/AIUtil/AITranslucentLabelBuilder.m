//
//  AITranslucentLabelBuilder.m
//  AITranslucentLabel
//
//  Created by Ailix on 15/3/12.
//  Copyright (c) 2015年 Ailix. All rights reserved.
//

#import "AITranslucentLabelBuilder.h"
#import "AITranslucentLabel.h"

@implementation AITranslucentLabelBuilder



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.alphaValue = .5;
    }
    return self;
}


- (AITranslucentLabel *)build
{
    // 可以在这里对 property 做检查
    NSAssert(self.text, @"必须填写标题");
//        AITranslucentLabel *label = [[AITranslucentLabel alloc] initWithFrame:_frame];
    AITranslucentLabel *label = [[AITranslucentLabel alloc] init];
    label.frame               = _frame;
    label.text                = _text;
    label.font                = _font;
    label.textColor           = _textColor;
    label.textAlignment       = _textAlignment;
    label.alphaValue          = _alphaValue;
    return label;
}



@end

