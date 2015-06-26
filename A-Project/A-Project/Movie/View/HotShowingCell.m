//
//  HotShowingCell.m
//  A-Project
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HotShowingCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
@implementation HotShowingCell

-(void)setHotMovie:(HotShoingMovie *)hotMovie
{
    if (_hotMovie!=hotMovie) {
        [_hotMovie release];
        _hotMovie =[hotMovie retain];
        self.filmNameLabel.text=hotMovie.filmName;
        self.gradeLabel.text=hotMovie.grade;
        self.cinemaCountLabel.text=hotMovie.cinemaCount;
        self.watchFilmLabel.text=hotMovie.watchFilm;
        [self.picImage sd_setImageWithURL:[NSURL URLWithString:hotMovie.minposterAddress]  placeholderImage:[UIImage imageNamed:@"picholder.png"]];
    }
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_cinemaCountLabel release];
    [_gradeLabel release];
    [_watchFilmLabel release];
    [_filmNameLabel release];
    [_picImage release];
    [super dealloc];
}
@end
