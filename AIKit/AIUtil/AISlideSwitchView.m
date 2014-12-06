

#import "AISlideSwitchView.h"

static  CGFloat const kFontSizeOfMenuButton = 14.0f;
static  CGFloat const kWidthOfMenuButtonMargin = 15.0f;
static  CGFloat const kWidthOfMenuButtonMargin2 = 25.0f;
static  CGFloat const kHeightOfIndicatorLabel = 2.0f;
static  CGFloat const kNavigationBarHeight = 44.0f;

@implementation AISlideSwitchView
{
    UIScrollView *_topScrollView;
    UIScrollView *_mainScrollView;
    NSMutableArray *_controllerArray;
    NSUInteger _selectedMenuItem;
    UILabel *_indicatorLabel;
}


#pragma mark - LifeCycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initValues];
    }
    return self;
}


- (void)dealloc
{
    self.menuButtonNormalColor  = nil;
    self.menuButtonSelectedColor = nil;
    _topScrollView = nil;
    _mainScrollView = nil;
    _controllerArray = nil;
    _indicatorLabel = nil;
}

- (void)initValues
{
    _selectedMenuItem = 100;
    _topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kNavigationBarHeight)];
    _topScrollView.showsHorizontalScrollIndicator = NO;    
    [self addSubview:_topScrollView];
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.bounds.size.width, self.bounds.size.height - kNavigationBarHeight)];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.delegate = self;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_mainScrollView];
    _controllerArray = [[NSMutableArray alloc] init];
}

- (void)createMenuButton
{
    _indicatorLabel = [[UILabel alloc] init];
    _indicatorLabel.backgroundColor = _menuButtonSelectedColor;
    [_topScrollView addSubview:_indicatorLabel];
    CGFloat topScrollViewContentWidth = _headerType & AIHeaderTypeMedia ? kWidthOfMenuButtonMargin2*2 + kWidthOfMenuButtonMargin : kWidthOfMenuButtonMargin;
    for (int i = 0; i < _controllerArray.count; i++) {
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIViewController *vc = _controllerArray[i];
        
        CGSize size;
        UIFont *font = [UIFont systemFontOfSize:kFontSizeOfMenuButton];
        
        if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending) {
            size = [vc.title sizeWithAttributes:@{NSFontAttributeName:font}];
        }
        else
        {
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
            size = [vc.title sizeWithFont:font];
#pragma GCC diagnostic warning "-Wdeprecated-declarations"
        }

        menuButton.frame = CGRectMake(topScrollViewContentWidth, 0, size.width, _topScrollView.bounds.size.height);
        topScrollViewContentWidth += size.width + kWidthOfMenuButtonMargin2;
        menuButton.titleLabel.font = [UIFont systemFontOfSize:kFontSizeOfMenuButton];
        [menuButton setTitle:vc.title forState:UIControlStateNormal];
        [menuButton setTitleColor:_menuButtonNormalColor forState:UIControlStateNormal];
        [menuButton setTitleColor:_menuButtonSelectedColor forState:UIControlStateSelected];
        [menuButton addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.tag = 100 + i;
        if (i == 0) {
            menuButton.selected = YES;
            _indicatorLabel.frame = CGRectMake(menuButton.frame.origin.x, menuButton.bounds.size.height - kHeightOfIndicatorLabel, size.width,kHeightOfIndicatorLabel);
        }
        [_topScrollView addSubview:menuButton];
    }
    _topScrollView.contentSize = CGSizeMake(topScrollViewContentWidth, kNavigationBarHeight);
    
}

#pragma mark - Public Method

- (void)buildUI
{
    NSUInteger number = [_dataSource numberOfTablesInSlideSwitchView:self];
    for (int i = 0; i < number; i++) {
        UIViewController *vc = [_dataSource slideSwitchView:self controllersForIndex:i];
        vc.view.frame = CGRectMake(_mainScrollView.bounds.size.width * i, 0, _mainScrollView.bounds.size.width , _mainScrollView.bounds.size.height);
        [_mainScrollView addSubview:vc.view];
        [_controllerArray addObject:vc];
    }
    _mainScrollView.contentSize = CGSizeMake(_mainScrollView.bounds.size.width * _controllerArray.count , _mainScrollView.bounds.size.height);
    [self createMenuButton];
    if ([_delegate respondsToSelector:@selector(slideSwitchView:didSelectTabAtIndex:)]) {
        [_delegate slideSwitchView:self didSelectTabAtIndex:_selectedMenuItem - 100];
    }
}

#pragma mark - MenuButton Action

- (void)menuButtonClick:(UIButton *)aButton
{
    
    [_mainScrollView setContentOffset:CGPointMake(_mainScrollView.bounds.size.width * (aButton.tag - 100), 0)];
    [self adjustScrollViewContentX:aButton];
    for (UIView *view in _topScrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            button.selected = NO;
        }
    }
    
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _indicatorLabel.frame = CGRectMake(aButton.frame.origin.x, aButton.bounds.size.height - kHeightOfIndicatorLabel, aButton.bounds.size.width, kHeightOfIndicatorLabel);
    } completion:^(BOOL finished) {
        aButton.selected = YES;
        if ([_delegate respondsToSelector:@selector(slideSwitchView:didSelectTabAtIndex:)]) {
            [_delegate slideSwitchView:self didSelectTabAtIndex:aButton.tag - 100];
        }
        
    }];

}

#pragma mark - MenuButton Animation

- (void)adjustScrollViewContentX:(UIButton *)aButton
{
    UIButton *nextButton = (UIButton *)[_topScrollView viewWithTag:aButton.tag + 1];
    UIButton *previousButton = (UIButton *)[_topScrollView viewWithTag:aButton.tag - 1];
    if (aButton.frame.origin.x - _topScrollView.contentOffset.x > _topScrollView.bounds.size.width - (kWidthOfMenuButtonMargin + aButton.bounds.size.width)) {

        if (aButton.tag - 100 + 1 + 2 > _controllerArray.count ) {
            [_topScrollView setContentOffset:CGPointMake(_topScrollView.contentSize.width - _topScrollView.bounds.size.width, 0) animated:YES];
        }
        else
        {
            [_topScrollView setContentOffset:CGPointMake(nextButton.frame.origin.x + nextButton.bounds.size.width - _topScrollView.bounds.size.width, 0) animated:YES];
        }
    }
    if (aButton.frame.origin.x - _topScrollView.contentOffset.x < 0) {
        if (aButton.tag - 100 == 0) {
            [_topScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        else{
            [_topScrollView setContentOffset:CGPointMake(previousButton.frame.origin.x - kWidthOfMenuButtonMargin, 0) animated:YES];
        }
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_mainScrollView == scrollView) {
        NSInteger tag = _mainScrollView.contentOffset.x / _mainScrollView.bounds.size.width + 100;
        UIButton *button = (UIButton *)[_topScrollView viewWithTag:tag];
        [self menuButtonClick:button];
    }
}


@end
