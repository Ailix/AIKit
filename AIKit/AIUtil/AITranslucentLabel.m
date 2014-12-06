

#import "AITranslucentLabel.h"

static NSInteger const titleLabelTag        = 100;
static NSInteger const translucentViewTag   = 200;


@implementation AITranslucentLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self uiConfig];
    }
    return self;
}

- (void)dealloc
{
    self.font = nil;
    self.text = nil;
    self.textColor = nil;
}

- (void)setText:(NSString *)text
{
    if (_text != text) {
        _text = [text copy];
        UILabel *titleLabel = (UILabel *)[self viewWithTag:titleLabelTag];
        titleLabel.text = _text;
    }
}

- (void)setFont:(UIFont *)font
{
    if (_font != font) {
        _font = font;
        UILabel *titleLabel = (UILabel *)[self viewWithTag:titleLabelTag];
        titleLabel.font = _font;
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    if (_textColor != textColor) {
        _textColor = textColor;
        UILabel *titleLabel = (UILabel *)[self viewWithTag:titleLabelTag];
        titleLabel.textColor = _textColor;
    }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textAlignment = textAlignment;
    UILabel *titleLabel = (UILabel *)[self viewWithTag:titleLabelTag];
    titleLabel.textAlignment = _textAlignment;
}

- (void)setAlphaValue:(CGFloat)alphaValue
{
    _alphaValue = alphaValue;
     UIView *translucentView = (UIView *)[self viewWithTag:translucentViewTag];
    translucentView.alpha = _alphaValue;
}

- (void)setTitleOffsetX:(CGFloat)titleOffsetX
{
    _titleOffsetX = titleOffsetX;
    UILabel *titleLabel = (UILabel *)[self viewWithTag:titleLabelTag];
    CGRect rect2 = CGRectMake(_titleOffsetX, 0.0f, self.frame.size.width - 2*_titleOffsetX, self.frame.size.height);
    titleLabel.frame = rect2;
}

- (void)uiConfig
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    UIView *translucentView = [[UIView alloc] initWithFrame:rect];
    translucentView.tag = translucentViewTag;
    translucentView.backgroundColor = [UIColor blackColor];
    translucentView.alpha = 0.5;
    [self addSubview:translucentView];
    
    CGRect rect2 = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:rect2];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = self.text;
    titleLabel.tag = titleLabelTag;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = self.font;
    [self addSubview:titleLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIView *translucentView = (UIView *)[self viewWithTag:translucentViewTag];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    translucentView.frame = rect;
    UILabel *titleLabel = (UILabel *)[self viewWithTag:titleLabelTag];
    CGRect rect2 = CGRectMake(_titleOffsetX, 0.0f, self.frame.size.width - 2*_titleOffsetX, self.frame.size.height);
    titleLabel.frame = rect2;
}




@end
