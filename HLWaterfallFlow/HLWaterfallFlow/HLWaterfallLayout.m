//
//  HLWaterfallLayout.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "HLWaterfallLayout.h"
//static const CGFloat ColumnMargin=10;
//static const CGFloat   RowMargin=ColumnMargin;
@interface  HLWaterfallLayout()

/** 这个字典用来存储每一列最大的Y值(每一列的高度) */
@property (nonatomic, strong) NSMutableDictionary *maxYDict;
/** 存放所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end


@implementation HLWaterfallLayout
/**
初始化工作最好在这里实现 因为collectinView的都准备完成了调用  重新布局重新调用prepareLayout
*/
-(instancetype)init{
    self=[super init];
    if (self) {
        //设置默认值
        self.columnMargin=10;
        //行距
        self.rowMargin=10;
        self.columnsCount=2;
        self.sectionInsets=UIEdgeInsetsMake(10, 10, 10, 10);
//        for (int i = 0; i<self.columnsCount; i++) {
//            NSString *column = [NSString stringWithFormat:@"%d", i];
//            self.maxYDict[column] = @(self.sectionInset.top);
//        }
        
    }
    return self;
}
- (instancetype)initWithColumnsCount:(NSInteger)columnsCount {
    if (self = [super init]) {
        self.columnsCount=columnsCount;
    }
    return self;
}
//+(HLWaterfallLayout *)initWithColumnsCount:(NSInteger)columnsCount{
//   HLWaterfallLayout *water   =[HLWaterfallLayout init];
//    water.columnsCount=columnsCount;
//    return water;
//    
//}
-(void)prepareLayout{
    [super prepareLayout];
    for (int i = 0; i<self.columnsCount; i++) {
        NSString *column = [NSString stringWithFormat:@"%d", i];
        self.maxYDict[column] = @(self.sectionInset.top);
    }
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    NSLog(@"获取个数%zd",count);
    
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attrsArray addObject:attrs];
        
    }
}
/**
只要显示的边界发生改变就重新布局:内部会重新调用 layoutAttributesForElementsInRect方法获得布局属性  重新布局
*/
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
//必须实现  UICollectionViewLayout  ICollectionViewFlowLayout已经自动实现了
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"layoutAttributesForItemAtIndexPath");
    //假设最短的是第0列
  __block  NSString *minColunmn=@"0";
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL * _Nonnull stop) {
        if ([maxY floatValue]<[[self.maxYDict objectForKey:minColunmn]floatValue]) {
            minColunmn=column;
        }
    }];
    //计算宽度
    
    CGFloat width=(self.collectionView.frame.size.width-self.sectionInsets.left-self.sectionInsets.right-(self.columnsCount-1)*self.columnMargin)/self.columnsCount;
    
    CGFloat heigt=[_delegate waterfallLayout:self itemHeightForWidth:width atIndexPath:indexPath];
    
    CGFloat x=self.sectionInsets.left+(width +self.columnMargin)*[minColunmn floatValue];
    CGFloat y=[self.maxYDict[minColunmn] floatValue]+self.rowMargin;
    
    //更新这一列的最大y值
    self.maxYDict[minColunmn]=@(y+heigt);
    
    //计算位置
    UICollectionViewLayoutAttributes *attrs=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.frame=CGRectMake(x, y, width, heigt);
    return attrs;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSLog(@"layoutAttributesForElementsInRect");
//    NSInteger count = [self.collectionView numberOfItemsInSection:0];
//    for (int i = 0; i<count; i++) {
//        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
//        [self.attrsArray addObject:attrs];
//    
//    }
    NSLog(@"%zd",self.attrsArray.count);
    return self.attrsArray;
}

- (NSMutableArray *)attrsArray{
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}
- (NSMutableDictionary *)maxYDict
{
    if (!_maxYDict) {
        self.maxYDict = [[NSMutableDictionary alloc] init];
    }
    return _maxYDict;
}
@end
