//
//  DataProcessingCenter.m
//  TuiTuiYYC
//
//  Created by ZhiF_Zhu on 2020/9/25.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "DataProcessingCenter.h"
#import "TabListContentMod.h"

@implementation DataProcessingCenter

- (instancetype)initWithDataType:(TabType)type{
    self = [super init];
    if (self) {
        _dataType = type;
        [self loadData];
    }
    return self;
}

- (void)loadData{
    NSArray *tempArr;
    switch (self.dataType) {
        case scoreList:
            tempArr = self.mScoreArr;
            break;
        case achevementList:
            //如果成就列表不存在
            if (![[NSUserDefaults standardUserDefaults] objectForKey:@"achevList"]) {
//              NSMutableArray *mutArr = [[NSMutableArray alloc] initWithArray:@[
//            @{@"id":@(0),@"state":@(NO),@"resultArea":@"100～500分",@"achevName":@"500"},@{@"id":@(1),@"state":@(NO),@"resultArea":@"500～1500分",@"achevName":@"1000"},@{@"id":@(2),@"state":@(NO),@"resultArea":@"1500～3000分",@"achevName":@"2000"},@{@"id":@(3),@"state":@(NO),@"resultArea":@"3000～5000分",@"achevName":@"3000"},@{@"id":@(4),@"state":@(NO),@"resultArea":@"5000分以上",@"achevName":@"5000"}
//              ]];
              NSMutableArray *mutArr = [[NSMutableArray alloc] initWithArray:@[
            @{@"id":@(0),@"state":@(NO),@"resultArea":@"100～500分",@"achevName":@"初出茅庐"},@{@"id":@(1),@"state":@(NO),@"resultArea":@"500～1500分",@"achevName":@"顾此失彼"},@{@"id":@(2),@"state":@(NO),@"resultArea":@"1500～3000分",@"achevName":@"游刃有余"},@{@"id":@(3),@"state":@(NO),@"resultArea":@"3000～5000分",@"achevName":@"小有成就"},@{@"id":@(4),@"state":@(NO),@"resultArea":@"5000分以上",@"achevName":@"登峰造极"}
              ]];

              [[NSUserDefaults standardUserDefaults] setObject:mutArr forKey:@"achevList"];
            }
            tempArr = self.mAchevArr;
            break;

        default:
            tempArr = self.stonRecordArr;

            break;
    }
    
    self.dataArray = [[NSMutableArray alloc] init];

    for (int i = 0; i<tempArr.count; i++) {
        TabListContentMod *md = [[TabListContentMod alloc] init];
        [md configWithDic:tempArr[i]];
        [self.dataArray addObject:md];
    }

}

- (void)isDidFinishAchevement:(NSString *)scoreStr{
    int result = [scoreStr intValue];
    if (result >= 100 && result <= 500) {
        [self saveAchevementState:0];
    }else if (result > 500 && result <= 1500) {
        [self saveAchevementState:1];
    }else if (result > 1500 && result <= 3000){
        [self saveAchevementState:2];
    }else if (result > 3000 && result <= 5000){
        [self saveAchevementState:3];
    }else if(result > 5000){
        [self saveAchevementState:4];
    }
}

//缓存流水数据
-(void)recordTabList:(NSDictionary *)recordDict{
    [self.stonRecordArr insertObject:recordDict atIndex:0];
    [[NSUserDefaults standardUserDefaults] setObject:self.stonRecordArr forKey:@"recordList"];

}

//缓存得分数据
-(void)scoreTabList:(NSDictionary *)scoreDict{
    [self.mScoreArr insertObject:scoreDict atIndex:0];//最新得分追加在前
    [[NSUserDefaults standardUserDefaults] setObject:self.mScoreArr forKey:@"defenList"];
    
    [self isDidFinishAchevement:scoreDict[@"score"]];
    
}

//缓存成就数据
- (void)saveAchevementState:(int)idx{
//    __block int rewardCount = 0;//奖励钻石数量

    NSMutableDictionary *mutDic = [self.mAchevArr[idx] mutableCopy];
    if ([mutDic[@"state"] intValue] == 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD showOnlyText:[NSString stringWithFormat:@"恭喜你！达成：\" %@ \"成就,快快去成就列表，点击查看领取吧！",self.mAchevArr[idx][@"achevName"]]];
            
//            /*发送通知，达成成就的奖励*/
//            rewardCount = (idx+1)*100;
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"achevToMoShi" object:self userInfo:@{@"moshiNum":@(rewardCount)}];
            
        });
        
        [mutDic setValue:@(YES) forKey:@"state"];
        [self.mAchevArr replaceObjectAtIndex:idx withObject:mutDic];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.mAchevArr forKey:@"achevList"];

}

#pragma mark -- 获取最值
- (float)getBestScore:(SortType)sort key:(NSString *)key{
    
    NSMutableArray *mutArr = [NSMutableArray array];
    float result;
    for (NSDictionary *dic in self.mScoreArr) {
        NSNumber *num = [NSNumber numberWithFloat:[[dic objectForKey:key] floatValue]];
        [mutArr addObject:num];
    }
    
    switch (sort) {
        case maxResult:{
            result = [[mutArr valueForKeyPath:@"@max.floatValue"] floatValue];
        }
            break;
        case minResult:{
            result = [[mutArr valueForKeyPath:@"@min.floatValue"] floatValue];
        }
            break;
        default:
            break;
    }

    return result;
}

#pragma mark -- 分数列表排序（默认升序）
- (NSArray *)getSortCompareResultList{
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSDictionary *dic in self.mScoreArr) {
        NSNumber *num = [NSNumber numberWithInt:[[dic objectForKey:@"score"] intValue]];
        [mutArr addObject:num];
    }
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;//降序
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;//升序
        }
        return (NSComparisonResult)NSOrderedSame;//相同
    };
    return [mutArr sortedArrayUsingComparator:cmptr];
}

#pragma mark -- Setter And Getter
- (NSMutableArray *)mScoreArr{
    if (!_mScoreArr) {
        _mScoreArr = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"defenList"]];
    }
    return _mScoreArr;
}

- (NSMutableArray *)mAchevArr{
    if (!_mAchevArr) {
        _mAchevArr = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"achevList"]];
    }
    return _mAchevArr;
}

- (NSMutableArray *)stonRecordArr{
    if (!_stonRecordArr) {
        _stonRecordArr = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"recordList"]];
    }
    return _stonRecordArr;
}

-(void)dealloc{
    
}

@end
