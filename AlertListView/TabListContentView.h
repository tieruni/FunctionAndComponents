//
//  TabListContentView.h
//  TheKingOfSandDunes
//
//  Created by ZhiF_Zhu on 2020/6/28.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "DTBaseAlertView.h"
#import "TabListDataSource.h"
#import "DataProcessingCenter.h"

#import "ScoreListViewCell.h"
#import "AchevementListViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^DoSomethingBlock)(void);

@interface TabListContentView : DTBaseAlertView
@property(nonatomic, strong) UIView *alertView;
@property(nonatomic, strong) UIView *headView;
@property(nonatomic, strong) UITableView *TabListView;
@property(nonatomic, strong) UILabel *headTitleLab;
@property(nonatomic, strong) UILabel *footTitleLab;

@property(nonatomic, strong) ScoreListViewCell *scoreCell;
@property(nonatomic, strong) AchevementListViewCell *achevCell;

@property(nonatomic,strong) TabListDataSource *dataSource;
@property(nonatomic,strong) DataProcessingCenter *dataCenter;

//@property(nonatomic, copy) otherAlertListBlock otherBlock;

//不同类型的列表
- (void)creatDifferentTypeList:(TabType)type contentBlock:(DoSomethingBlock)contentBlock;
- (void)creatOtherCustomAlertView:(UIView *)otherView contentBlock:(DoSomethingBlock)contentBlock;

@end

NS_ASSUME_NONNULL_END
