//
//  TabListContentMod.h
//  TheKingOfSandDunes
//
//  Created by ZhiF_Zhu on 2020/6/28.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface TabListContentMod : NSObject

//得分
@property(nonatomic, strong) NSString *icon;
@property(nonatomic, strong) NSNumber *level;
@property(nonatomic, strong) NSString *score;
@property(nonatomic, strong) NSString *time;

//成就
@property(nonatomic, strong) NSNumber *ID;
@property(nonatomic, assign) BOOL state;
@property(nonatomic, strong) NSString *achvArea;
@property(nonatomic, strong) NSString *achvStr;

//钻石
@property(nonatomic, strong) NSString *DiamondsCount;
@property(nonatomic, assign) BOOL addState;//增加种状态(游戏或成就)
@property(nonatomic, assign) BOOL reduceState;//减少的状态(商店或其它)
@property(nonatomic, strong) NSString *recordtime;
@property(nonatomic, strong) NSString *rewardType;


- (void)configWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
