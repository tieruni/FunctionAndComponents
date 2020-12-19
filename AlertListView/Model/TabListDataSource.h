//
//  TabListDataSource.h
//  XXX
//
//  Created by ZhiF_Zhu on 2020/8/4.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CellConfigureBefore)(id _Nullable cell,id _Nonnull model,NSIndexPath * _Nullable indexPath);

NS_ASSUME_NONNULL_BEGIN

@interface TabListDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

@property(nonatomic, strong) NSMutableArray *dataArray;

//id

@property(nonatomic, strong) IBInspectable NSString *cellIdentifier;

@property(nonatomic,copy) CellConfigureBefore cellConfigureBefore;


//自定义
//RAC -- rxSwift
-(id)initWithListIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

- (void)addDataAray:(NSArray *)datas;

- (id)modelIsAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
