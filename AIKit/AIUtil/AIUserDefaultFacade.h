//
//  AIUserDefaultFacade.h
//  ThirdPartyLogin
//
//  Created by alex on 14/12/15.
//  Copyright (c) 2014年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户信息&第三方登录信息管理类 存储在NSUserDefaults
 */
@interface AIUserDefaultFacade : NSObject


/**
 *  是否已登录
 */
extern NSString * const kIsLogined;


/**
 *  NSUserDefaults键名
 */

/** 是否第一次运行 */
extern NSString * const kConfigIsFirstLoadKey;

/** 微信授权信息 ---> WXAuthorInfo */
extern NSString * const kWXAuthorInfoKey;

/** 第三方平台用户信息 */
extern NSString * const kUserInfoKey;

/** 人人用户好友id */
extern NSString * const kFriendIdKey;

/** 是否已经登陆 */
extern NSString * const kIsLoginKey;

/** 搞起uid */
extern NSString * const kGQUidKey;


/**
 *  取NSUserDefaults中keyName对应的值
 *
 *  @param keyName 键名
 *
 *  @return 键名对应的值
 */

- (id)objectForKey:(NSString *)keyName;

/**
 *  设置NSUserDefaults中keyName对应的值
 *
 *  @param value   需要设置的值
 *  @param keyName 需要设置的键名
 */
- (void)setObject:(id)value forKey:(NSString *)keyName;


/**
 *  清除NSUserDefaults信息
 */
- (void)clearConfiguration;


/**
 *  单例
 *
 *  @return 单例实例
 */
+ (instancetype)sharedInstance;



/**
 *  获取设备号
 *
 *  @return 设备号
 */
+ (NSString *)getEncrypt;



/**
 *  存储搞起用户id
 *
 *  @param uid
 */
+ (void)setGQUid:(NSString *)uid;


/**
 *  获取搞起用户id
 *
 *  @return uid
 */
+ (NSString *)getGQUid;



/**
 *  存储第三方登录id
 *
 *  @param oid
 */
+ (void)setOid:(NSString *)oid;


/**
 *  获取第三方登录id
 *
 *  @return oid
 */
+ (NSString *)getOid;


/**
 *  存储人人好友id
 *
 *  @param friendIds
 */
+ (void)setFriendId:(NSString *)friendId;

/**
 *  获取人人好友id
 *
 *  @return friendIds
 */
+ (NSString *)getFriendId;



/**
 *  存储第三方登录平台标示
 *  1.qq 2.微信 3.人人 4.微博
 *  @param platform
 */
+ (void)setPlatform:(NSString *)platform;


/**
 *  获取第三方登录平台标示
 * 1.qq 2.微信 3.人人 4.微博
 *  @return platform
 */
+ (NSString *)getPlatform;

/**
 *  存储QQToken
 *
 *  @param tencentToken
 */
+ (void)setTencentToken:(NSString *)tencentToken;


/**
 *  获取QQToken
 *
 *  @return tencentToken
 */
+ (NSString *)getTencentToken;


/**
 *  存储微信授权信息
 *
 *  @param authorInfoDict
 *
 *  例:[AIUserDefaultFacade setWXAuthorInfo:authorDict];
 */
+ (void)setWXAuthorInfo:(NSDictionary *)authorInfoDict;


/**
 *  获取微信授权信息 ---> WXAuthorInfo 
 *
 *  @return authorInfoDict
 *
 *  例:   WXAuthorInfo *wxAuthorInfo = [WXAuthorInfo wxAuthorInfoWithDict:[AIUserDefaultFacade getWXAuthorInfo]];
 
            accessToken   -> wxAuthorInfo.accessToken
            expires_in    -> wxAuthorInfo.expires_in
            openId        -> wxAuthorInfo.openId
            refresh_token -> wxAuthorInfo.refresh_token
            scope         -> wxAuthorInfo.scope
 */
+ (NSDictionary *)getWXAuthorInfo;

/**
 *  存储用户信息
 *
 *  @param userInfoDict
 */
+ (void)setUserInfo:(NSDictionary *)userInfoDict;


/**
 *  获取第三方登录的用户信息 ---> GQUserInfo
 *
 *  @return userInfo
 *
 *  例:    GQUserInfo *userInfo = [GQUserInfo gqUserInfoWithDict:[AIUserDefaultFacade getUserInfo]];
            userName  -> userInfo.userName
            imgUrl    -> userInfo.imgUrl
            school    -> userInfo.school
            sex       -> userInfo.sex
            birthday  -> userInfo.birthday
            phone     -> userInfo.phone
            about     -> userInfo.about
 */
+ (NSDictionary *)getUserInfo;

/**
 *  存储简介
 *
 *  @param about
 */
+ (void)setAbout:(NSString *)about;


/**
 *  获取简介
 *
 *  @return about
 */
+ (NSString *)getAbout;

/**
 *  存储生日
 *
 *  @param birthday
 */
+ (void)setBirthday:(NSString *)birthday;


/**
 *  获取生日
 *
 *  @return birthday
 */
+ (NSString *)getBirthday;


/**
 *  存储头像
 *
 *  @param imgUrl
 */
+ (void)setImgUrl:(NSString *)imgUrl;


/**
 *  获取头像
 *
 *  @return imgUrl
 */
+ (NSString *)getImgUrl;


/**
 *  存储手机号
 *
 *  @param phone
 */
+ (void)setPhone:(NSString *)phone;


/**
 *  获取手机号
 *
 *  @return phone
 */
+ (NSString *)getPhone;


/**
 *  存储学校
 *
 *  @param school
 */
+ (void)setSchool:(NSString *)school;


/**
 *  获取学校
 *
 *  @return school
 */
+ (NSString *)getSchool;



/**
 *  存储性别
 *
 *  @param sex
 */
+ (void)setSex:(NSString *)sex;


/**
 *  获取性别
 *
 *  @return sex
 */
+ (NSString *)getSex;

/**
 *  存储用户名
 *
 *  @param userName
 */
+ (void)setUserName:(NSString *)userName;


/**
 *  获取用户名
 *
 *  @return userName
 */
+ (NSString *)getUserName;



/**
 *  存储用户信息 填写完个人资料后调用
 *
 *  例:
 * [AIUserDefaultFacade setAbout:@"Monster"];
 * [AIUserDefaultFacade setBirthday:@"1988-04-12"];
 * [AIUserDefaultFacade setPhone:@"13000000000"];
 * [AIUserDefaultFacade setSchool:@"东华大学"];
 * 最后调用[AIUserDefaultFacade saveUserInfo];将用户资料持久化
 */
+ (void)saveUserInfo;



@end
