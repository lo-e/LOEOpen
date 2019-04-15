//
//  Macro.h
//  LOEOpen
//
//  Created by Rachel on 2019/4/6.
//  Copyright © 2019 LOE. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

//获取有效信息key
#define INFO_MAIN_KEY @"NT_COMMODITY"

//保存有赞token和过期时间到userDefaults
#define TOKEN_SAVE_ENABLE NO
#define TOKEN_EXPIRE_USERDEFAULT_KEY @"AAT_TOKEN_EXPIRE_USERDEFAULT_KEY"
#define TOKEN_USERDEFAULT_KEY @"AAT_TOKEN_USERDEFAULT_KEY"

//用于获取有赞token的相关应用参数
#define YZ_CLIENT_ID @"83dc22a21ef3e6f22b"
#define YZ_CLIENT_SECRET @"fe002b92f2d85112ae7bd6a8c65a24f4"
#define YZ_KDT_ID @"42852113"

//获取有赞token
#define YZ_URL_TOKEN @"https://open.youzan.com/oauth/token"

//获取出售中的商品列表
#define YZ_URL_ONSALE_LIST @"https://open.youzan.com/api/oauthentry/youzan.items.onsale/3.0.0/get"





#pragma mark - Notinterest
//======================================================
#define Archive_Notes_Key @"Archive_Notes_Key"

//圆角
#define LOE_NoteItem_radius 6
//note展示在大补充视图上的视图高度
#define LOE_NoteSupplement_Height 160

#define Note_Cell_Identifier @"Note_Cell_Identifier"
#define Note_AddCell_Identifier @"Note_AddCell_Identifier"
#define Note_PageCell_Identifier @"Note_PageCell_Identifier"
#define Note_SectionHeader_Identifier @"Note_SectionHeader_Identifier"

#define CloseKeyboardNotification @"CloseKeyboardNotification"

#define LOE_Note_Key @"LOE_Note_Key"
#define LOE_Range_Key @"LOE_Range_Key"
#define LOE_Index_Key @"LOE_index_Key"

#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define LOE_NAV_BAR_HEIGHT \
({CGFloat height = 64;\
if (IPHONE_X) {\
height += 24;\
}\
(height);})

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//黄色
#define LOE_COLOR_YELLOW [UIColor colorWithRed:250/255.f green:250/255.f blue:16/255.f alpha:1.0]

#endif /* Macro_h */
