//
//  AchevementListViewCell.m
//  TuiTuiYYC
//
//  Created by ZhiF_Zhu on 2020/9/25.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "AchevementListViewCell.h"

@implementation AchevementListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.backgroundColor = [UIColor clearColor];
    //logo
    self.ItemImv = [[UIImageView alloc] initWithFrame:CGRectMake(5, 7.5, 30, 30)];
    [self addSubview:self.ItemImv];
    //成就名称
    self.ItemLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ItemImv.frame)+10, 7.5, 100, 30)];
    self.ItemLab.font = [UIFont systemFontOfSize:13];
    self.ItemLab.textColor = [UIColor colorWithWhite:0 alpha:0.8];
    
    [self addSubview:self.ItemLab];
    //达成状态
    self.statelab = [[UILabel alloc] initWithFrame:CGRectMake(self.width-220, 7.5, 60, 30)];
    self.statelab.font = [UIFont systemFontOfSize:12];
    self.statelab.textAlignment = NSTextAlignmentRight;
    self.statelab.textColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    [self addSubview:self.statelab];

    //成就条件
    self.sublLab = [[UILabel alloc] initWithFrame:CGRectMake(self.width-180, 7.5, 120, 30)];
    self.sublLab.font = [UIFont systemFontOfSize:12];
    self.sublLab.textAlignment = NSTextAlignmentRight;
    self.sublLab.textColor = [UIColor colorWithWhite:0 alpha:0.5];

    [self addSubview:self.sublLab];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
