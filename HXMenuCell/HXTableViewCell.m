//
//  HXTableViewCell.m
//  HXMenuCell
//
//  Created by  MAC on 15/2/13.
//  Copyright (c) 2015年 华夏大地教育. All rights reserved.
//

#import "HXTableViewCell.h"

@implementation HXTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

@end
