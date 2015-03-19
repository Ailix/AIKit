//
//  UILabel+AIExtension.m
//  StringSize
//
//  Created by alex on 14/11/12.
//  Copyright (c) 2014年 alex. All rights reserved.
//

#import "UILabel+AIExtension.h"

@implementation UILabel (AIExtension)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}
@end
