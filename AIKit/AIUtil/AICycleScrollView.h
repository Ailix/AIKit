

#import <UIKit/UIKit.h>



@class AICycleScrollView;
@protocol AICycleScrollViewDelegate <NSObject>

@optional
/**
 *  点击某一页的回调方法
 *
 *  @param cycleScrollView 目标cycleScrollView
 *  @param index           点击的位置
 */
- (void)cycleScrollView:(AICycleScrollView *)cycleScrollView didTapViewAtIndex:(NSInteger)index;

@end

@protocol AICycleScrollViewDataSource <NSObject>

@required
/**
 *  获取滚动视图上视图的总数
 *
 *  @param cycleScrollView 目标cycleScrollView
 *
 *  @return 视图的个数
 */
- (NSInteger)numberOfPagesInCycleScrollView:(AICycleScrollView *)cycleScrollView;

/**
 *  获取滚动视图上某一页对应的视图对象
 *
 *  @param cycleScrollView 目标cycleScrollView
 *  @param index           页数/位置
 *
 *  @return 页数对应的视图对象
 */
- (UIView *)cycleScrollView:(AICycleScrollView *)cycleScrollView contentViewAtIndex:(NSInteger)index;

/**
 *  获取滚动视图上某一页对应的标题
 *
 *  @param cycleScrollView 目标cycleScrollView
 *  @param index           页数/位置
 *
 *  @return 页数对应的标题
 */
- (NSString *)cycleScrollView:(AICycleScrollView *)cycleScrollView titleAtIndex:(NSInteger)index;

@end


@interface AICycleScrollView : UIView<UIScrollViewDelegate>
@property (nonatomic,assign) id <AICycleScrollViewDelegate> delegate;//代理
@property (nonatomic,assign) id <AICycleScrollViewDataSource> dataSource;//数据源

//重载数据
- (void)reloadData;
@end
