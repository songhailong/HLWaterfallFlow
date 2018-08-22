//
//  HLStackLayout.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "HLStackLayout.h"

@implementation HLStackLayout
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
//必须实现  UICollectionViewLayout  ICollectionViewFlowLayout已经自动实现了
//-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array=[super layoutAttributesForElementsInRect:rect];
    return array;
}
@end
