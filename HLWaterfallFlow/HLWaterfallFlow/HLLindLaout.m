//
//  HLLindLaout.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "HLLindLaout.h"
static const CGFloat HMItemWH = 100;
@implementation HLLindLaout

/**
 初始化工作最好在这里实现 因为collectinView的都准备完成了调用  重新布局重新调用prepareLayout
 */
-(void)prepareLayout{
    [super prepareLayout];
    
    // 每个cell的尺寸
    self.itemSize = CGSizeMake(HMItemWH, HMItemWH);
    CGFloat inset = (self.collectionView.frame.size.width - HMItemWH) * 0.5;
    //上左下右
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = HMItemWH * 0.7;
}



/**
 只要显示的边界发生改变就重新布局:内部会重新调用 layoutAttributesForElementsInRect方法获得布局属性  重新布局
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //计算可见的矩形框
    CGRect visiableRect;
    visiableRect.size=self.collectionView.frame.size;
    //看见内容开始坐标点
    visiableRect.origin=self.collectionView.contentOffset;
    
  NSArray *array=  [super layoutAttributesForElementsInRect:rect];
    //计算屏幕最中间的x
    CGFloat centerX=self.collectionView.contentOffset.x+self.collectionView.frame.size.width*0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (CGRectIntersectsRect(visiableRect, attrs.frame)) continue;
        
        
        //每一个item的CenterX
        CGFloat itemCenterX= attrs.center.x;
        //每一个item距离中心的绝对值
        ABS(itemCenterX-centerX);
        //根据距离屏幕最中间的距离计算缩放比例
        //差距越小，缩放比例越大
        CGFloat scale=1+0.7*(1-ABS(itemCenterX-centerX)/self.collectionView.frame.size.width);
        attrs.transform3D=CATransform3DMakeScale(scale, scale, 1.0);
     }
    return array;
}

/**
 用于设置scrollview 停止滚动的位置
 proposedContentOffset  原本collectionview停止那一刻的位置
 velocity  速度 可用正负盘判断滚动方向
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //计算出scrollview最后停留的范围
    CGRect lastRect;
    lastRect.origin=proposedContentOffset;
    lastRect.size=self.collectionView.frame.size;
    
    
    //最中间的
    CGFloat centerX=proposedContentOffset.x+self.collectionView.frame.size.width*0.5;
    //取出范围内的所有属性
    NSArray *array=[self layoutAttributesForElementsInRect:lastRect];
    
    CGFloat adjustOffsetX=MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(centerX-attrs.center.x)<ABS(adjustOffsetX)) {
            adjustOffsetX=attrs.center.x-centerX;
        }
    }
    return CGPointMake(proposedContentOffset.x+adjustOffsetX, proposedContentOffset.y);
}


@end
