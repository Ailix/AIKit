

#import "AITranslucentLabel.h"


@interface AITranslucentLabel ()

/** 标签 */
@property (nonatomic,strong) UILabel *label;

/** 透明视图 */
@property (nonatomic,strong) UIView *translucentView;

@end


@implementation AITranslucentLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [self configUI];
}


- (void)configUI
{
    [self addSubview:self.translucentView];
    [self addSubview:self.label];
    self.alphaValue = .5;
    
}

+ (instancetype)labelWithBuilder:(AITranslucentLabelBuilderBlock)builderBlock
{
    NSParameterAssert(builderBlock);
    AITranslucentLabelBuilder *builder = [[AITranslucentLabelBuilder alloc] init];
    builderBlock(builder);
    return [builder build];
}

- (void)setText:(NSString *)text
{
    if (_text != text) {
        _text       = [text copy];
        _label.text = text;
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    if (_textColor != textColor) {
        _textColor       = textColor;
        _label.textColor = textColor;
    }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    if (_textAlignment != textAlignment) {
        _textAlignment       = textAlignment;
        _label.textAlignment = textAlignment;
    }
}

- (void)setFont:(UIFont *)font
{
    if (_font != font) {
        _font       = font;
        _label.font = font;
    }
}

- (void)setAlphaValue:(CGFloat)alphaValue
{
    if (_alphaValue != alphaValue) {
        _alphaValue            = alphaValue;
        _translucentView.alpha = alphaValue;
    }
}

- (UIView *)translucentView
{
    if (_translucentView == nil) {
        _translucentView                 = [[UIView alloc] init];
        _translucentView.backgroundColor = [UIColor blackColor];
//        _translucentView.alpha           = 0.5;
    }
    return _translucentView;
}

- (UILabel *)label
{
    if (_label == nil) {
        _label           = [[UILabel alloc] init];
        _label.textColor = [UIColor whiteColor];
    }
    return _label;
}




- (void)layoutSubviews
{
    [super layoutSubviews];
    self.translucentView.frame = self.bounds;
    self.label.frame           = self.bounds;
}
@end


