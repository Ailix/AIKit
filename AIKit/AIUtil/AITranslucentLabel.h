

#import <UIKit/UIKit.h>
#import "AITranslucentLabelBuilder.h"

typedef void(^AITranslucentLabelBuilderBlock)(AITranslucentLabelBuilder *builder);


@interface AITranslucentLabel : UIView

/** 文本 */
@property(nonatomic,copy)   NSString           *text;

/** 字体 */
@property(nonatomic,strong) UIFont             *font;

/** 文本颜色 */
@property(nonatomic,strong) UIColor            *textColor;

/** 对齐方式 */
@property(nonatomic)        NSTextAlignment    textAlignment;

/** 透明度 */
@property(nonatomic)        CGFloat            alphaValue;


/**
 *  构造方法
 *
 *  @param builderBlock 构造器代码块
 *
 *  @return AITranslucentLabel实例对象
 */
+ (instancetype)labelWithBuilder:(AITranslucentLabelBuilderBlock)builderBlock;


@end

