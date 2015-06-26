//
//  HotShoingMovie.m
//  A-Project
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HotShoingMovie.h"

@implementation HotShoingMovie
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"grade"]) {
        self.grade=[value stringByAppendingString:@"分"];
    }
    if ([key isEqualToString:@"cinemaCount"]) {
        self.cinemaCount=[value stringByAppendingString:@"家影院上映"];
    }
    if ([key isEqualToString:@"watchFilm"]) {
        self.watchFilm=[value stringByAppendingString:@"人购票"];
    }
}
@end
