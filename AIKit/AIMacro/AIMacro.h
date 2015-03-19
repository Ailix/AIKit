//
//  AIMacro.h
//  Create
//
//  Created by alex on 14/11/7.
//  Copyright (c) 2014年 alex. All rights reserved.
//

#ifndef Create_AIMacro_h
#define Create_AIMacro_h


//shift+command+x

#undef  AI_DEBUG
#define AI_DEBUG 2


#undef DLog
#undef AILog

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define AILog(fmt,...) NSLog((@"[Line %d] " fmt), __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#   define AILog(...)
#endif

/** 屏幕宽 */
#undef AI_SCREEN_WIDTH
#define AI_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/** 屏幕宽 */
#undef AI_SCREEN_HEIGHT
#define AI_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



/** 导航栏高 */
#undef  AI_NAVIGATIONBAR_HEIGHT
#define AI_NAVIGATIONBAR_HEIGHT 44.

/** 状态栏高 */
#undef  AI_STATUSBAR_HEIGHT
#define AI_STATUSBAR_HEIGHT 20.

/** 标签栏高 */
#undef  AI_TABBAR_HEIGHT
#define AI_TABBAR_HEIGHT 49.

/** 系统12号字体 */
#undef  AI_SYSTEMFONT12
#define AI_SYSTEMFONT12      [UIFont systemFontOfSize:12.]

/** 系统13号字体 */
#undef  AI_SYSTEMFONT13
#define AI_SYSTEMFONT13      [UIFont systemFontOfSize:13.]

/** 系统15号字体 */
#undef  AI_SYSTEMFONT15
#define AI_SYSTEMFONT15      [UIFont systemFontOfSize:15.]

/** 粗体17号字体 */
#undef  AI_BOLDSYSTEMFONT17
#define AI_BOLDSYSTEMFONT17  [UIFont boldSystemFontOfSize:17.]


#endif
