//
//  gameOverAlertView.m
//  MooNovel
//
//  Created by ZhiF_Zhu on 2020/10/19.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "gameOverAlertView.h"

@implementation gameOverAlertView

- (void)yycSetBaseAlertView{
    UIView *overView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 360, 280)];
    overView.layer.cornerRadius = 10;
    overView.clipsToBounds = YES;
    overView.center = self.center;
    [self addSubview:overView];
    UIImageView *scoreImgV = [[UIImageView alloc] initWithFrame:overView.bounds];
    scoreImgV.userInteractionEnabled = YES;
    scoreImgV.image = [UIImage imageNamed:@"over"];
    [overView addSubview:scoreImgV];
    
    //获得分数
//    _defenLab = [UILabel newLabel:@"" andTextColor:[UIColor greenColor] andFont:[UIFont systemFontOfSize:18]];
//    _defenLab.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    _defenLab = [[UILabel alloc] init];
    _defenLab.font = [UIFont systemFontOfSize:18];
    _defenLab.layer.cornerRadius = 10;
    _defenLab.clipsToBounds = YES;
    _defenLab.textAlignment = NSTextAlignmentCenter;
    _defenLab.textColor = [UIColor orangeColor];
    _defenLab.frame = CGRectMake(0, 0, overView.width/2, 40);
    _defenLab.centerX = overView.width/2;
    _defenLab.centerY = overView.height/2;
    [overView addSubview:_defenLab];
    
    //其它提示
//    _otherLab = [UILabel newLabel:@"" andTextColor:[UIColor greenColor] andFont:[UIFont systemFontOfSize:18]];
//    _otherLab.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    _otherLab = [[UILabel alloc] init];
    _otherLab.font = [UIFont systemFontOfSize:18];
    _otherLab.layer.cornerRadius = 10;
    _otherLab.clipsToBounds = YES;
    _otherLab.textAlignment = NSTextAlignmentCenter;
    _otherLab.textColor = [UIColor orangeColor];
    _otherLab.frame = CGRectMake(0, 0, overView.width/2, 40);
    _otherLab.centerX = overView.width/2;
    _otherLab.centerY = overView.height/2-40;
    [overView addSubview:_otherLab];
    
//    UIButton *closeBtn = [UIButton buttonWithFrame:CGRectMake(0, 0, 40, 40) Title:@"退出" Font:15 TextColor:[UIColor redColor] target:self action:@selector(clickCloseAction)];
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [closeBtn setTitle:@"退出" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(clickCloseAction) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.layer.cornerRadius = 10;
    closeBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    closeBtn.centerX = overView.width-30;
    closeBtn.centerY = 30;
    [overView addSubview:closeBtn];

    //再来一局
//    UIButton *againBtn = [UIButton buttonWithFrame:CGRectMake(0, 0, 120, 40) Title:@"重置游戏" Font:15 TextColor:[UIColor orangeColor] target:self action:@selector(clickAgainAction)];
    UIButton *againBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    againBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [againBtn setTitle:@"重置游戏" forState:UIControlStateNormal];
    [againBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [againBtn addTarget:self action:@selector(clickAgainAction) forControlEvents:UIControlEventTouchUpInside];
    againBtn.layer.cornerRadius = 10;
    againBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    againBtn.centerX = overView.width/4;
    againBtn.centerY = overView.height-40;
    [overView addSubview:againBtn];
    
    //结束
//    UIButton *fuhuoBtn = [UIButton buttonWithFrame:CGRectMake(0, 0, 120, 40) Title:@"复活继续" Font:15 TextColor:[UIColor orangeColor] target:self action:@selector(clickFuHuoAction)];
    UIButton *fuhuoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    fuhuoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [fuhuoBtn setTitle:@"复活继续" forState:UIControlStateNormal];
    [fuhuoBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [fuhuoBtn addTarget:self action:@selector(clickFuHuoAction) forControlEvents:UIControlEventTouchUpInside];
    fuhuoBtn.layer.cornerRadius = 10;
    fuhuoBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    fuhuoBtn.centerX = overView.width*3/4;
    fuhuoBtn.centerY = overView.height-40;
    [overView addSubview:fuhuoBtn];
    
}

-(void)AlertNewScoreContent{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)clickCloseAction{
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"endNotif" object:self userInfo:nil];
}

-(void)clickAgainAction{
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"againNotif" object:self userInfo:nil];
    
//    if (self.againBlock) {
//        self.againBlock();
//    }
    
}

-(void)clickFuHuoAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fuhuoNotif" object:self userInfo:@{@"type":@"reduce",@"changeNum":@(50)}];

//    if (self.endBlock) {
//        self.endBlock();
//    }
    
}


//重写父类方法，使其点击弹窗之外不隐藏
-(void)yycHideAction{
    
}

@end
