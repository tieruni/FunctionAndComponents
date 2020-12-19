//
//  ScoreListViewCell.m
//  TuiTuiYYC
//
//  Created by ZhiF_Zhu on 2020/8/11.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "ScoreListViewCell.h"

@implementation ScoreListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.backgroundColor = [UIColor clearColor];
    
    self.ItemImv = [[UIImageView alloc] initWithFrame:CGRectMake(5, 7.5, 30, 30)];
    self.ItemImv.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.ItemImv];
    
//    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 7.5, 160, 30)];
//    self.timeLab.font = [UIFont systemFontOfSize:10];
//    [self addSubview:self.ItemLab];
    
    self.ItemLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ItemImv.frame)+10, 7.5, 150, 30)];
    self.ItemLab.font = [UIFont systemFontOfSize:13];
    self.ItemLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.ItemLab];

    self.sublLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ItemLab.frame)+10, 7.5, 60, 30)];
    self.sublLab.font = [UIFont systemFontOfSize:15];
    self.sublLab.textAlignment = NSTextAlignmentCenter;
    self.sublLab.textColor = [UIColor orangeColor];
    [self addSubview:self.sublLab];
    
}

//- (void)wejdsuvlawega:(TabListContentMod *)mod{
//    self.ItemImv.image = [UIImage imageNamed:mod.icon];
//    self.ItemLab.text = mod.score;
//    self.sublLab.text = mod.time;
//}

#pragma mark -- PresentDelegate
//- (void)initWithDataDidChange{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(initWithDataDidChange)]) {
//        [self.delegate initWithDataDidChange];
//    }
//
//    NSLog(@"执行了代理");
//}
//
//- (void)reloadUI{
//    NSLog(@"数据模型改变了,通知刷新UI");
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
