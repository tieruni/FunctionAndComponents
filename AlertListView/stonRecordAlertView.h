//
//  stonRecordAlertView.h
//  MooNovel
//
//  Created by ZhiF_Zhu on 2020/10/22.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "DTBaseAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface stonRecordAlertView : DTBaseAlertView
@property(nonatomic, strong) UIView *alertView;
@property(nonatomic, strong) UIView *headView;
@property(nonatomic, strong) UITableView *TabListView;
@property(nonatomic, strong) UILabel *headTitleLab;

-(void)addWeekContentToWindow;

@end


NS_ASSUME_NONNULL_END
