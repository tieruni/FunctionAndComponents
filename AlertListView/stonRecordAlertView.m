//
//  stonRecordAlertView.m
//  MooNovel
//
//  Created by ZhiF_Zhu on 2020/10/22.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "stonRecordAlertView.h"

@implementation stonRecordAlertView

- (void)yycSetBaseAlertView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 308)];
    view.center = self.center;
    [self addSubview:view];
    UIImageView *scoreImgV = [[UIImageView alloc] initWithFrame:view.bounds];
    scoreImgV.image = [UIImage imageNamed:@"alert_bg"];
    [view addSubview:scoreImgV];
    self.alertView = view;

    [self.alertView addSubview:self.headView];//不跟随一起滚动

    [_headView addSubview:self.headTitleLab];

    UIButton *closeBtn  = [[UIButton alloc] initWithFrame:CGRectMake(250, 5, 30, 30)];
    [closeBtn setImage:[UIImage imageNamed:@"alert_cls"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:closeBtn];


}

-(void)addWeekContentToWindow{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

#pragma mark -- 交互事件
- (void)closeAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeAlertNotif" object:self userInfo:nil];
    [self removeFromSuperview];
}

//重写父类方法，使其点击弹窗之外不隐藏
-(void)yycHideAction{
    
}

#pragma mark -- Setter And Getter
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 40)];
        _headView.backgroundColor = [UIColor clearColor];
    }
    return _headView;
}

-(UILabel *)headTitleLab{
    if (!_headTitleLab) {
        _headTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 250, 30)];
        _headTitleLab.font = [UIFont systemFontOfSize:15];
    }
    return _headTitleLab;
}
@end
