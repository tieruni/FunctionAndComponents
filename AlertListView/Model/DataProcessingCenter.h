//
//  DataProcessingCenter.h
//  TuiTuiYYC
//
//  Created by ZhiF_Zhu on 2020/9/25.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {//最大/最小值
    maxResult,
    minResult,
} SortType;

typedef enum : NSUInteger {
    defaultList,
    scoreList,
    achevementList,

} TabType;

typedef void(^didSuccessReach)(int ston);//成就奖励

@interface DataProcessingCenter : NSObject
@property(nonatomic, copy) didSuccessReach rewardBlock;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic, assign) TabType dataType;

@property(nonatomic, strong) NSMutableArray *mScoreArr;
@property(nonatomic, strong) NSMutableArray *mAchevArr;

@property(nonatomic, strong) NSMutableArray *stonRecordArr;


- (instancetype)initWithDataType:(TabType)type;

//更新成就
- (void)isDidFinishAchevement:(NSString *)scoreStr;

//更新得分
-(void)scoreTabList:(NSDictionary *)scoreDict;

//消耗记录
-(void)recordTabList:(NSDictionary *)recordDict;

//取得最高或最低分
- (float)getBestScore:(SortType)sort key:(NSString *)key;

//获取排序后的分数列表
- (NSArray *)getSortCompareResultList;

@end

NS_ASSUME_NONNULL_END
