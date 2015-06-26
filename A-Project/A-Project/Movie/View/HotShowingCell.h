//
//  HotShowingCell.h
//  A-Project
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotShoingMovie.h"
@interface HotShowingCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *picImage;
@property (retain, nonatomic) IBOutlet UILabel *filmNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *watchFilmLabel;
@property (retain, nonatomic) IBOutlet UILabel *gradeLabel;
@property (retain, nonatomic) IBOutlet UILabel *cinemaCountLabel;
@property(nonatomic,retain)HotShoingMovie *hotMovie;
@end
