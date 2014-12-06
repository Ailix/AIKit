

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AIHeaderType){
    AIHeaderTypeNews = 0,//新闻
    AIHeaderTypeMedia = 1//媒体 图片/视频
};


@class AISlideSwitchView;

@protocol AISlideSwitchViewDataSource <NSObject>

@required

/**
 *  获取首页新闻总页数
 *
 *  @param aSlideSwitchView 目标SlideSwitchView
 *
 *  @return 总页数
 */
- (NSUInteger)numberOfTablesInSlideSwitchView:(AISlideSwitchView *)aSlideSwitchView;

/**
 *  获取某一页对应的视图的控制器
 *
 *  @param aSlideSwitchView 目标SlideSwitchView
 *  @param index            页数/位置
 *
 *  @return 页数对应的控制器
 */
- (UIViewController *)slideSwitchView:(AISlideSwitchView *)aSlideSwitchView controllersForIndex:(NSUInteger)index;

@end

@protocol AISlideSwitchViewDelegate <NSObject>

/**
 *  点击某一项的回调方法
 *
 *  @param aSlideSwitchView 目标SlideSwitchView
 *  @param index            页数/位置
 */
- (void)slideSwitchView:(AISlideSwitchView *)aSlideSwitchView didSelectTabAtIndex:(NSUInteger)index;

@end


@interface AISlideSwitchView : UIView<UIScrollViewDelegate>

@property (nonatomic,assign) id <AISlideSwitchViewDelegate> delegate;//代理
@property (nonatomic,assign) id <AISlideSwitchViewDataSource> dataSource;
@property (nonatomic,retain) UIColor *menuButtonNormalColor;//未选中时的文字颜色
@property (nonatomic,retain) UIColor *menuButtonSelectedColor;//选中时的文字颜色
@property (nonatomic,assign) AIHeaderType headerType;//加载的首页类型

/**
 *  创建UI
 */
- (void)buildUI;
@end

