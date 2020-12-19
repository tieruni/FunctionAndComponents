//
//  TipRiDView.m
//  XueDiZongShu
//
//  Created by ZhiF_Zhu on 2020/12/2.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "TipRiDView.h"

@implementation TipRiDView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        self.layer.cornerRadius = frame.size.height*0.5;
        self.clipsToBounds = YES;
        _tipImv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _tipImv.layer.cornerRadius = _tipImv.frame.size.height*0.5;
        _tipImv.clipsToBounds = YES;
        _tipImv.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
        [self addSubview:_tipImv];
        _tipLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 50, 30)];
        _tipLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLab];
    }
    return self;
}

@end
