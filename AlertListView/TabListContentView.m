//
//  TabListContentView.m
//  TheKingOfSandDunes
//
//  Created by ZhiF_Zhu on 2020/6/28.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "TabListContentView.h"
static NSString *cellIdentifier= @"UITableViewCellIdentifier_default" ;

static NSString *ScoreIdentifier= @"UITableViewCellIdentifierKey_score" ;
static NSString *AchevIdentifier= @"UITableViewCellIdentifierKey_achev" ;

@implementation TabListContentView

//只加载一次，跟viewDidLoad一样
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

- (void)creatDifferentTypeList:(TabType)type contentBlock:(DoSomethingBlock)contentBlock{
    
    self.dataCenter = [[DataProcessingCenter alloc] initWithDataType:type];

    //不同类型的列表
    switch (type) {
        case scoreList:{
            //注册Cell
            [self.TabListView registerClass:[ScoreListViewCell class] forCellReuseIdentifier:ScoreIdentifier];
            self.dataSource = [[TabListDataSource alloc] initWithListIdentifier:ScoreIdentifier configureBlock:^(ScoreListViewCell*  _Nullable cell, TabListContentMod*  _Nonnull model, NSIndexPath * _Nullable indexPath) {
                if (contentBlock) {
                    contentBlock();
                }
                cell.ItemImv.image = [UIImage getGifimageNamed:@"rightRun"];
//                cell.ItemLab.text = [NSString stringWithFormat:@"%@%@%@%@",model.time,@"\t",@"\t",model.level];
                cell.ItemLab.text = [NSString stringWithFormat:@"奔跑:%@秒",model.level];
                cell.sublLab.text = [NSString stringWithFormat:@"%@分",model.score];

            }];
            break;
        }
        case achevementList:{
            //注册Cell
            [self.TabListView registerClass:[AchevementListViewCell class] forCellReuseIdentifier:AchevIdentifier];
            self.dataSource = [[TabListDataSource alloc] initWithListIdentifier:AchevIdentifier configureBlock:^(AchevementListViewCell*  _Nullable cell, TabListContentMod*  _Nonnull model, NSIndexPath * _Nullable indexPath) {
                if (contentBlock) {
                    contentBlock();
                }
                
//                cell.ItemImv.image = [UIImage imageNamed:[NSString stringWithFormat:@"achev%@",model.ID]];
                cell.ItemImv.image = [UIImage imageNamed:@"AchievementIcon"];
                cell.ItemLab.text = [NSString stringWithFormat:@"%@",model.achvStr];
                cell.statelab.text = @"(未达成)";
                cell.sublLab.text = [NSString stringWithFormat:@"%@",model.achvArea];
                
                if (model.state == YES) {
                    cell.ItemImv.image = [UIImage imageNamed:@"AchievementIconFinish"];
                    cell.ItemLab.textColor = [UIColor orangeColor];
                    cell.statelab.text = @"(已达成)";
                    cell.statelab.textColor = [UIColor greenColor];
                    cell.sublLab.textColor = [UIColor orangeColor];
                }

            }];

            break;
        }
        default:
            //注册Cell
            [self.TabListView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
            self.dataSource = [[TabListDataSource alloc] initWithListIdentifier:cellIdentifier configureBlock:^(UITableViewCell*  _Nullable cell, TabListContentMod*  _Nonnull model, NSIndexPath * _Nullable indexPath) {
                
                cell.imageView.image = [UIImage imageNamed:@"icon_xuanshi"];
                cell.textLabel.text = [NSString stringWithFormat:@"%@（%@）",model.DiamondsCount,model.rewardType];
                cell.textLabel.font = [UIFont systemFontOfSize:11];
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",model.recordtime];
                cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
                
                if (model.addState) {
                    cell.textLabel.textColor = [UIColor greenColor];
                }
                if (model.reduceState) {
                    cell.textLabel.textColor = [UIColor redColor];
                }

            }];
            break;
    }
    
    //数据处理中心
//    self.dataCenter = [[DataProcessingCenter alloc] initWithDataType:type];

    [self.dataSource addDataAray:self.dataCenter.dataArray];
    
    self.TabListView.dataSource = self.dataSource;
    
    [self.alertView addSubview:self.TabListView];

    if (self.dataCenter.dataArray.count > 0) {
        self.footTitleLab.text = @"已全部加载完毕";
    }else{
        self.footTitleLab.text = @"暂无记录，快快体验一局吧！";
    }
    
    self.TabListView.tableFooterView = self.footTitleLab;

    [self showAlertView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];

}

- (void)creatOtherCustomAlertView:(UIView *)otherView contentBlock:(DoSomethingBlock)contentBlock{
    [self.alertView addSubview:otherView];
        
    if (contentBlock) {
        contentBlock();
    }
    
    [self showAlertView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
}

-(void)showAlertView{
    [UIView animateWithDuration:0.3 animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        
    } completion:nil];
}

#pragma mark -- 交互事件
- (void)closeAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeAlertNotif" object:self userInfo:nil];
    [UIView animateWithDuration:0.3 animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

//重写父类方法，使其点击弹窗之外不隐藏
-(void)yycHideAction{
    
}

#pragma mark -- Setter And Getter
- (UITableView *)TabListView{
    if (!_TabListView) {
        _TabListView = [[UITableView alloc] initWithFrame:CGRectMake(5, 40, 270, 308-40-10) style:UITableViewStylePlain];
        _TabListView.layer.cornerRadius = 10;
        _TabListView.clipsToBounds = YES;
        
//        _TabListView.separatorStyle = UITableViewScrollPositionNone;//分隔线
//        [self.TabListView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];

    }
    return _TabListView;
}

-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 40)];
        _headView.backgroundColor = [UIColor clearColor];
    }
    return _headView;
}

-(UILabel *)headTitleLab{
    if (!_headTitleLab) {
        _headTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 270, 30)];
        _headTitleLab.font = [UIFont systemFontOfSize:15];
        _headTitleLab.backgroundColor = [UIColor blackColor];
        _headTitleLab.textColor = [UIColor whiteColor];
        _headTitleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _headTitleLab;
}

-(UILabel *)footTitleLab{
    if (!_footTitleLab) {
        _footTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 270, 30)];
        _footTitleLab.textColor = [UIColor lightGrayColor];
        _footTitleLab.font = [UIFont systemFontOfSize:13];
        _footTitleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _footTitleLab;
}

@end
