//
//  HotShoingMovie.h
//  A-Project
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotShoingMovie : NSObject
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *firstPlayTime;
@property(nonatomic,copy)NSString *posterAddress;//图片
@property(nonatomic,copy)NSString *buyCount;
@property(nonatomic,copy)NSString *nearShowCount;
@property(nonatomic,copy)NSString *minposterAddress;//小图片
@property(nonatomic,copy)NSString *watchFilm;//想看人数
@property(nonatomic,copy)NSString *cinemaCount;
@property(nonatomic,copy)NSString *sceneCount;
@property(nonatomic,copy)NSString *filmName;//电影名称
@property(nonatomic,copy)NSString *shortIntro;
@property(nonatomic,copy)NSString *horizontalLogo;
@property(nonatomic,copy)NSString *filmType;
@property(nonatomic,copy)NSString *nation;
@property(nonatomic,copy)NSString *grade;//评分
@property(nonatomic,copy)NSString *filmID;
@end
