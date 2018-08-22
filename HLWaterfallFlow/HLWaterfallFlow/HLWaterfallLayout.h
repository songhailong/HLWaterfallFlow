//
//  HLWaterfallLayout.h
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLWaterfallLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property(nonatomic,assign)CGFloat columnMargin;
/** 每一行之间的间距 */
@property(nonatomic,assign)CGFloat rowMargin;
/** 显示多少列 */
@property(nonatomic,assign)NSInteger  columnsCount;

-(instancetype)initWithColumnsCount:(NSInteger)columnsCount;
@end
