//
//  ScoreListViewCell.h
//  TuiTuiYYC
//
//  Created by ZhiF_Zhu on 2020/8/11.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabListContentMod.h"
//#import "MyPresent.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScoreListViewCell : UITableViewCell/*<PresentDelegate>*/
@property(nonatomic, strong) UIImageView *ItemImv;
//@property(nonatomic, strong) UILabel *timeLab;
@property(nonatomic, strong) UILabel *ItemLab;
@property(nonatomic, strong) UILabel *sublLab;

//@property(nonatomic, strong) TabListContentMod *dataMod;
//
//@property(nonatomic, weak) id<PresentDelegate> delegate;
//

//- (void)wejdsuvlawega:(TabListContentMod *)mod;

@end

NS_ASSUME_NONNULL_END
