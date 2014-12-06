

#import <UIKit/UIKit.h>

@interface AIDock : UIView

/**
 *  在Dock上添加标签栏选项(用于底部标签栏)
 *
 *  @param icon   未选中时的图片
 *  @param hlIcon 选中时的图片
 *  @param title  标签栏选项的标题
 */
- (void)addDockItemWithIcon:(NSString *)icon highlightedIcon:(NSString *)hlIcon title:(NSString *)title;

/**
 *  在Dock上添加按钮(用于按钮组控件)
 *
 *  @param icon  按钮的图片
 *  @param title 按钮的标题
 */
- (void)addNormalItemWithIcon:(NSString *)icon title:(NSString *)title;


@property (nonatomic, copy) void (^itemClickBlock)(NSInteger index);//某一项被选中的代码块

@property (nonatomic, assign) int currentIndex;//当前项位置

@end