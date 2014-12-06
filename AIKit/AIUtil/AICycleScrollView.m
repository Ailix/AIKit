

#import "AICycleScrollView.h"
#import "AIPageControl.h"
#import "AITranslucentLabel.h"
@implementation AICycleScrollView
{
    
    UIScrollView *_scrollView;
    
    AIPageControl *_pageControl;
    
    NSInteger _totalPages;
    NSInteger _currentPage;
    AITranslucentLabel *_titleLabel;
    NSMutableArray *_currentImages;      // 存放当前滚动的三张图片
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self != nil)
    {
       
//        _totalPages = picsArray.count;
        _currentPage = 0;                                    // 显示的是图片数组里的第一张图片
        
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 3,_scrollView.frame.size.height);
        
        _scrollView.backgroundColor = [UIColor blackColor];
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _scrollView.showsVerticalScrollIndicator = NO;
        
        _scrollView.pagingEnabled = YES;
        
//        CGRect rect = CGRectMake(80, self.bounds.size.height - 20, 160, 20);
        CGRect rect = CGRectMake(240 , self.bounds.size.height - 45 + 1, 60, 20);
        _pageControl = [[AIPageControl alloc] initWithFrame:rect];
        _pageControl.imagePageStateNormal = [UIImage imageNamed:@"feed_focus_pagecontrol_inactive"];
        _pageControl.imagePageStateHighlighted = [UIImage imageNamed:@"feed_focus_pagecontrol_active"];
        _pageControl.userInteractionEnabled = NO;
        CGRect rect2 = CGRectMake(0, 135, 320, 25);
        _titleLabel = [[AITranslucentLabel alloc] initWithFrame:rect2];
        _titleLabel.titleOffsetX = 10.0f;
        _titleLabel.font = [UIFont boldSystemFontOfSize:12];
    }
    return self;
}

- (void)dealloc
{
   _pageControl = nil;
   _titleLabel = nil;
   _scrollView = nil;
    [_currentImages removeAllObjects];
}


- (void)setDataSource:(id<AICycleScrollViewDataSource>)dataSource
{
//    NSLog(@"%@",NSStringFromCGPoint(_scrollView.contentOffset));

    _dataSource = dataSource;
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    [self addSubview:_titleLabel];
    [self reloadData];
}


- (void)reloadData
{
    _totalPages = [_dataSource numberOfPagesInCycleScrollView:self];
    if (_totalPages == 0) {
        return;
    }
    _scrollView.delegate = self;
    _pageControl.numberOfPages = _totalPages;
    //[self.animationTimer resumeTimerAfterTimeInterval:self.animationDuration];
    [self setUp];
}


- (void)setUp
{
    _pageControl.currentPage = _currentPage;
    _titleLabel.text = [_dataSource cycleScrollView:self titleAtIndex:_currentPage];

    NSArray *subViews = [_scrollView subviews];   //取出scrollView的滚动视图;
    
    if([subViews count] != 0)
    {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }

    [self getDisplayImagesWithCurrentPage:_currentPage];
    [self configImgageViewWithCount:3];
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];

}


- (void)configImgageViewWithCount:(NSInteger)count
{
    for (int i = 0; i < count; i++)
    {
        UIView *contentView = _currentImages[i];
        contentView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        //单指单击
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        [contentView addGestureRecognizer:singleTapGestureRecognizer];
#if 1
        
        UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        //单指双击
        doubleTapGestureRecognizer.numberOfTapsRequired = 2;
        [contentView addGestureRecognizer:doubleTapGestureRecognizer];
        //双击时将单击手势失效
        [singleTapGestureRecognizer requireGestureRecognizerToFail:doubleTapGestureRecognizer];
        
        
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
        [contentView addGestureRecognizer:pinchGestureRecognizer];
#endif
        contentView.frame = CGRectOffset(contentView.bounds, contentView.frame.size.width * i, 0);
        [_scrollView addSubview:contentView];
    }
}

- (void)getDisplayImagesWithCurrentPage:(NSInteger)current
{
    
    NSInteger previous = [self validPageValue:current-1];
    
    NSInteger next = [self validPageValue:current+1];
    
    
    if (_currentImages == nil) {
        _currentImages = [[NSMutableArray alloc] init];
    }
    
    [_currentImages removeAllObjects];
    
    [_currentImages addObject:[_dataSource cycleScrollView:self contentViewAtIndex:previous]];
    [_currentImages addObject:[_dataSource cycleScrollView:self contentViewAtIndex:current]];
    [_currentImages addObject:[_dataSource cycleScrollView:self contentViewAtIndex:next]];

//    NSLog(@"%@",_currentImages);
}

- (NSInteger)validPageValue:(NSInteger)value
{
    // value＝0为第一张，value = -1为前面一张
    if(value == -1) value = _totalPages - 1;
    if(value == _totalPages) value = 0;

    return value;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat x = scrollView.contentOffset.x;
//    NSLog(@"did:%@",NSStringFromCGPoint(scrollView.contentOffset));
    
    if(x >= (2*scrollView.frame.size.width)) {
        _currentPage = [self validPageValue:_currentPage+1];
        [self setUp];
    }
    
    if(x <= 0) {
        _currentPage = [self validPageValue:_currentPage-1];
        [self setUp];
    }

}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (tap.numberOfTapsRequired == 1) {
        if ([_delegate respondsToSelector:@selector(cycleScrollView:didTapViewAtIndex:)])
        {
            [_delegate cycleScrollView:self didTapViewAtIndex:_currentPage];
        }
    }
    else if (tap.numberOfTapsRequired == 2) {
        tap.view.transform = CGAffineTransformIdentity;
    }
}



- (void)pinchAction:(UIPinchGestureRecognizer *)pinch
{
    CGFloat scale = pinch.scale;
    pinch.view.transform = CGAffineTransformMakeScale(scale, scale);
    
}


@end
