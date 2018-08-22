//
//  HLWaterfallLayout.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "HLWaterfallLayout.h"
static const CGFloat ColumnMargin=10;
static const CGFloat    RowMargin=ColumnMargin;
@implementation HLWaterfallLayout
/**
初始化工作最好在这里实现 因为collectinView的都准备完成了调用  重新布局重新调用prepareLayout
*/

-(instancetype)initWithColumnsCount:(NSInteger)columnsCount{
    if(self=[super init]){
        //默认两列
        self.columnsCount=columnsCount;
    }
    return self;
}
-(void)prepareLayout{
    [super prepareLayout];
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
