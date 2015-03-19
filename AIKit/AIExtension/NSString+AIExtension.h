//
//  NSString+AIExtension.h
//  SelfPage
//
//  Created by alex on 14/11/24.
//  Copyright (c) 2014年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSString (AIExtension)

- (CGFloat)ai_heightWithFont:(UIFont *)aFont maxWidth:(CGFloat)maxWidth;

- (NSString *)ai_MD5Hash;

-(NSString *)ai_URLEncodingUTF8String;
-(NSString *)ai_URLDecodingUTF8String;


- (NSString *)ai_trimHead;
- (NSString *)ai_trimTail;
- (NSString *)ai_trimBoth;

@end
