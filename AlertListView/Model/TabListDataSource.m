//
//  TabListDataSource.m
//  XXX
//
//  Created by ZhiF_Zhu on 2020/8/4.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "TabListDataSource.h"

@implementation TabListDataSource

-(id)initWithListIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before{
    self = [super init];
    if (self) {
        _cellIdentifier = identifier;
        _cellConfigureBefore = [before copy];
    }
    return self;
}

- (void)addDataAray:(NSArray *)datas{
    if (!datas) {
        return;
    }
    
    if (self.dataArray.count > 0) {
        [self.dataArray removeAllObjects];
    }
    
    [self.dataArray addObjectsFromArray:datas];
}

- (id)modelIsAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

#pragma mark -- UITabaleViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return !self.dataArray ? 0 :self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{//这里会循环调用

    id cell = nil;
    if ([self.cellIdentifier isEqualToString:@"UITableViewCellIdentifier_default"]) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:self.cellIdentifier];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    id model = [self modelIsAtIndexPath:indexPath];
    if (self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model, indexPath);
    }
    
    return cell;
}



#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return !self.dataArray ? 0 :self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    id model = [self modelIsAtIndexPath:indexPath];
    if (self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model, indexPath);
    }
    
    return cell;
}

#pragma mark -- Setter And Getter
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
