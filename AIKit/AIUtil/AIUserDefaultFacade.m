

#import "AIUserDefaultFacade.h"

@import UIKit;

NSString * const kIsLogined = @"isLogined";

NSString * const kGQUidKey = @"GQUid";

NSString * const kConfigIsFirstLoadKey = @"isFirstLoad";

NSString * const kOpenIdKey = @"GQOid";

NSString * const kPlatformKey = @"GQPlatform";

NSString * const kTencentTokenKey = @"GQTencentTokenKey";

NSString * const kWXAuthorInfoKey = @"authorInfo";

NSString * const kUserInfoKey = @"userInfo";

NSString * const kFriendIdKey = @"friendId";

NSString * const kIsLoginKey = @"isLogIn";


static NSString * GQAbout;

static NSString * GQBirthday;

static NSString * GQImgUrl;

static NSString * GQPhone;

static NSString * GQSchool;

static NSString * GQSex;

static NSString * GQUserName;


@interface AIUserDefaultFacade ()



/** 存储所有key对应数据的字典 */
@property(nonatomic,strong)NSMutableDictionary *configData;


@property(nonatomic,strong)NSArray *keyArray;

@property(nonatomic,strong)NSArray *removeKeyArray;

@end

@implementation AIUserDefaultFacade

+ (instancetype)sharedInstance
{
    static AIUserDefaultFacade *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
            _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (NSArray *)keyArray
{
    if (_keyArray == nil) {
        _keyArray = @[kWXAuthorInfoKey,kUserInfoKey,kIsLoginKey,kGQUidKey,kFriendIdKey,kPlatformKey];
    }
    return _keyArray;
}

- (NSArray *)removeKeyArray
{
    if (_removeKeyArray == nil) {
        _removeKeyArray = @[kWXAuthorInfoKey,kUserInfoKey,kIsLoginKey,kPlatformKey];
    }
    return _removeKeyArray;
}

-(id)init
{
    self = [super init];
    
    self.configData = [NSMutableDictionary dictionary];
    
    NSString *isFirstLoad = [[NSUserDefaults standardUserDefaults] objectForKey:kConfigIsFirstLoadKey];
    
    if(isFirstLoad == nil || ![isFirstLoad isEqualToString:@"N"]){
        [self saveDefaultData];
    }else{
        [self loadAllConfigData];
    }
    
    return self;
}

-(void)saveDefaultData
{
    //第一次LOAD存储默认值
    
    [self setObject:@"N" forKey:kConfigIsFirstLoadKey];
    
}

- (id)objectForKey:(NSString *)keyName
{
    return [self.configData objectForKey:keyName];
}

- (void)setObject:(id)value forKey:(NSString *)keyName
{

    [self.configData setObject:value forKey:keyName];

    [[NSUserDefaults standardUserDefaults] setObject:value forKey:keyName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}



-(void)loadAllConfigData
{

    for (NSString *key in self.keyArray) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:key] != nil) {
            self.configData[key] = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        }
    }
    NSDictionary *userInfoDict = self.configData[kUserInfoKey];
    GQAbout = userInfoDict[@"about"];
    GQBirthday = userInfoDict[@"birthday"];
    GQImgUrl = userInfoDict[@"imgUrl"];
    GQPhone = userInfoDict[@"phone"];
    GQSchool = userInfoDict[@"school"];
    GQSex = userInfoDict[@"sex"];
    GQUserName = userInfoDict[@"userName"];
    
}

- (void)clearConfiguration
{
    
//    NSLog(@"configData >> %@",self.configData);
    
    
    [self.configData removeAllObjects];
    
     for (NSString *key in self.removeKeyArray)
     {
         [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
     }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}



static NSString *deviceId = nil;

+ (NSString *)getEncrypt
{
    if (deviceId == nil) {
        NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
        
        NSString *uuidStr = [uuid UUIDString];
        
        NSRange range = NSMakeRange(uuidStr.length - 6, 6);
        
        deviceId = [uuidStr substringWithRange:range];
    }
    
    return deviceId;
}


+ (void)setGQUid:(NSString *)uid
{
    [[self sharedInstance] setObject:uid forKey:kGQUidKey];

}

+ (NSString *)getGQUid
{
    return [[self sharedInstance] objectForKey:kGQUidKey];
}

+ (void)setOid:(NSString *)oid
{
    [[self sharedInstance] setObject:oid forKey:kOpenIdKey];
}

+ (NSString *)getOid
{
    return [[self sharedInstance] objectForKey:kOpenIdKey];
}

+ (void)setFriendId:(NSString *)friendId
{
    [[self sharedInstance] setObject:friendId forKey:kFriendIdKey];
}

+ (NSString *)getFriendId
{
    return [[self sharedInstance] objectForKey:kFriendIdKey];
}


+ (void)setPlatform:(NSString *)platform
{
    [[self sharedInstance] setObject:platform forKey:kPlatformKey];
}

+ (NSString *)getPlatform
{
    return [[self sharedInstance] objectForKey:kPlatformKey];
}


+ (void)setTencentToken:(NSString *)tencentToken
{
    [[self sharedInstance] setObject:tencentToken forKey:kTencentTokenKey];
}

+ (NSString *)getTencentToken
{
    return [[self sharedInstance] objectForKey:kTencentTokenKey];
}


+ (void)setWXAuthorInfo:(NSDictionary *)authorInfoDict
{
    [[self sharedInstance] setObject:authorInfoDict forKey:kWXAuthorInfoKey];
}

+ (NSDictionary *)getWXAuthorInfo
{
    return [[self sharedInstance] objectForKey:kWXAuthorInfoKey];
}



+ (void)setUserInfo:(NSDictionary *)userInfoDict
{
    [[self sharedInstance] setObject:userInfoDict forKey:kUserInfoKey];
    
    GQAbout = userInfoDict[@"about"];
    GQBirthday = userInfoDict[@"birthday"];
    GQImgUrl = userInfoDict[@"imgUrl"];
    GQPhone = userInfoDict[@"phone"];
    GQSchool = userInfoDict[@"school"];
    GQSex = userInfoDict[@"sex"];
    GQUserName = userInfoDict[@"userName"];
}


+ (NSDictionary *)getUserInfo
{
    return [[self sharedInstance] objectForKey:kUserInfoKey];
}


+ (void)setAbout:(NSString *)about
{
    GQAbout = about;
}

+ (NSString *)getAbout
{
    return GQAbout;
}

+ (void)setBirthday:(NSString *)birthday
{
    GQBirthday = birthday;
}

+ (NSString *)getBirthday
{
    return GQBirthday;
}

+ (void)setImgUrl:(NSString *)imgUrl
{
    GQImgUrl = imgUrl;
}

+ (NSString *)getImgUrl
{
    return GQImgUrl;
}

+ (void)setPhone:(NSString *)phone
{
    GQPhone = phone;
}

+ (NSString *)getPhone
{
    return GQPhone;
}

+ (void)setSchool:(NSString *)school
{
    GQSchool = school;
}

+ (NSString *)getSchool
{
    return GQSchool;
}

+ (void)setSex:(NSString *)sex
{
    GQSex = sex;
}

+ (NSString *)getSex
{
    return GQSex;
}

+ (void)setUserName:(NSString *)userName
{
    GQUserName = userName;
}

+ (NSString *)getUserName
{
    return GQUserName;
}

+ (void)saveUserInfo
{
    NSDictionary *userInfoDict = @{@"about":GQAbout,
                                   @"birthday":GQBirthday,
                                   @"imgUrl":GQImgUrl,
                                   @"phone":GQPhone,
                                   @"school":GQSchool,
                                   @"sex":GQSex,
                                   @"userName":GQUserName};
    [[self sharedInstance] setObject:userInfoDict forKey:kUserInfoKey];
}

@end
