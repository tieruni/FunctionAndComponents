//
//  gameOverAlertView.h
//  MooNovel
//
//  Created by ZhiF_Zhu on 2020/10/19.
//  Copyright © 2020 朱洁珊. All rights reserved.
//

#import "DTBaseAlertView.h"

//typedef void(^AgainBlock)(void);
//typedef void(^EndBlock)(void);

//@protocol GameOverAlertDelegate <NSObject>
//
//@end

NS_ASSUME_NONNULL_BEGIN

@interface gameOverAlertView : DTBaseAlertView
@property(nonatomic, strong) UILabel *defenLab;

@property(nonatomic, strong) UILabel *otherLab;

//@property(nonatomic, copy) AgainBlock againBlock;
//@property(nonatomic, copy) EndBlock endBlock;

//@property(nonatomic, weak) id<GameOverAlertDelegate> over_delegate;

@end

NS_ASSUME_NONNULL_END
