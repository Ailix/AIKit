//
//  UIStoryboard+AIExtension.h
//  Create
//
//  Created by alex on 14/11/6.
//  Copyright (c) 2014年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (AIExtension)

+ (id)ai_mainStoryboardViewControllerByIdentifier:(NSString *)identifier;

+ (id)ai_viewControllerByIdentifier:(NSString *)aIdentifier withStoryboard:(NSString *)storyboard;


@end
