
#import "AIDock.h"
#import "AIButton.h"

@interface AIDock()

{
    // 当前选中了哪个item
    AIDockItem *_currentItem;
}
@property (nonatomic, assign) int selectedIndex;
@end

@implementation AIDock

// init方法内部会调用initWithFramne
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景(拿到image进行平铺)
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    }
    return self;
}

- (void)dealloc
{
    self.itemClickBlock = nil;
}


#pragma mark 添加item
- (void)addDockItemWithIcon:(NSString *)icon highlightedIcon:(NSString *)hlIcon title:(NSString *)title
{
    // 1.创建item
    AIDockItem *item = [AIDockItem buttonWithType:UIButtonTypeCustom];
    [self addSubview:item];
    
    // 2.设置文字
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    // 3.设置图片
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:hlIcon] forState:UIControlStateSelected];
    
    // 4.监听点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.调整item的边框
    [self adjustDockItemsFrame];
}

- (void)addNormalItemWithIcon:(NSString *)icon title:(NSString *)title
{
    // 1.创建item
    AIButton *item = [AIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:item];
    
    // 2.设置文字
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 3.设置图片
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
   
    
    // 4.监听点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.调整item的边框
    [self adjustDockItemsFrame];

}


#pragma mark 点击了某个item
- (void)itemClick:(AIDockItem *)item
{
    
    // 1.让当前的item取消选中
    _currentItem.selected = NO;
    
    // 2.让新的item选中
    item.selected = YES;
    
    // 3.让新的item变为当前选中
    _currentItem = item;
    
    // 4.调用block
    if (_itemClickBlock) {
        _itemClickBlock(item.tag);
    }
}

#pragma mark 调整item的边框
- (void)adjustDockItemsFrame
{
    NSUInteger count = self.subviews.count;
    
    // 0.算出item的尺寸
    CGFloat itemWidth = self.frame.size.width / count;
    CGFloat itemHeight = self.frame.size.height;
    
    for (int i = 0; i<count; i++) {
        // 1.取出子控件
        AIDockItem *item = self.subviews[i];
        
        // 2.算出边框
        item.frame = CGRectMake(i * itemWidth, 0, itemWidth, itemHeight);
        
        if (i == 0) { // 3.第0个item选中
            item.selected = YES;
            _currentItem = item;
        }
        
        // 4.设置item的tag
        item.tag = i;
    }
}

// 不要求掌握
#pragma mark 重写设置选中索引的方法
- (void)setSelectedIndex:(int)selectedIndex
{
    // 1.条件过滤
    if (selectedIndex < 0 || selectedIndex >= self.subviews.count) return;
    
    // 2.赋值给成员变量
    _selectedIndex = selectedIndex;
    
    // 3.对应的item
    AIDockItem *item = self.subviews[selectedIndex];
    
    // 4.相当于点击了这个item
    [self itemClick:item];
}
@end