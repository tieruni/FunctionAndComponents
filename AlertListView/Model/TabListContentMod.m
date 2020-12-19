//
//  TabListContentMod.m
//  TheKingOfSandDunes
//
//  Created by ZhiF_Zhu on 2020/6/28.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "TabListContentMod.h"

@implementation TabListContentMod

- (void)configWithDic:(NSDictionary *)dic{
    self.icon = [dic objectForKey:@"icon"];
    self.level = [dic objectForKey:@"level"];
    self.score = [dic objectForKey:@"score"];
    self.time = [dic objectForKey:@"time"];
    
    self.ID = [dic objectForKey:@"id"];
    self.achvStr = [dic objectForKey:@"achevName"];
    self.state = [[dic objectForKey:@"state"] boolValue];
    self.achvArea = [dic objectForKey:@"resultArea"];
    
    self.DiamondsCount = [dic objectForKey:@"stonCount"];
    self.addState = [[dic objectForKey:@"addState"] boolValue];
    self.reduceState = [[dic objectForKey:@"reduceState"] boolValue];
    self.recordtime = [dic objectForKey:@"recordtime"];
    self.rewardType = [dic objectForKey:@"rewardType"];
}

//可以进一步对模型数据进行解归档
+ (BOOL)supportsSecureCoding{
        return YES;
}

//序列化
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:@"icon"];
    [coder encodeObject:@"level"];
    [coder encodeObject:@"score"];
    [coder encodeObject:@"time"];
    
    [coder encodeObject:@"id"];
    [coder encodeObject:@"achevName"];
    [coder encodeObject:@"state"];
    [coder encodeObject:@"resultArea"];
    
    [coder encodeObject:@"stonCount"];
    [coder encodeObject:@"addState"];
    [coder encodeObject:@"reduceState"];
    [coder encodeObject:@"recordtime"];
    [coder encodeObject:@"rewardType"];
}

//反序列化
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
        self.icon = [coder decodeObjectForKey:@"icon"];
        self.level = [coder decodeObjectForKey:@"level"];
        self.score = [coder decodeObjectForKey:@"score"];
        self.time = [coder decodeObjectForKey:@"time"];
        
        self.ID = [coder decodeObjectForKey:@"id"];
        self.achvStr = [coder decodeObjectForKey:@"achevName"];
        self.state = [[coder decodeObjectForKey:@"state"] boolValue];
        self.achvArea = [coder decodeObjectForKey:@"resultArea"];
        
        self.DiamondsCount = [coder decodeObjectForKey:@"stonCount"];
        self.addState = [[coder decodeObjectForKey:@"addState"] boolValue];
        self.reduceState = [[coder decodeObjectForKey:@"reduceState"] boolValue];
        self.recordtime = [coder decodeObjectForKey:@"recordtime"];
        self.rewardType = [coder decodeObjectForKey:@"rewardType"];
    }
    return self;
}


@end
