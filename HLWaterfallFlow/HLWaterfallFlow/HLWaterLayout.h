//
//  HLWaterLayout.h
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/23.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HLWaterLayout;
@protocol HLWaterfallFlowLayoutDelegate<NSObject>
@required
//计算item高度的代理方法，将item的高度与indexPath传递给外界
- (CGFloat)waterfallLayout:(HLWaterLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath;
@end
@interface HLWaterLayout : UICollectionViewLayout
@property(nonatomic,assign)UIEdgeInsets sectionInsets;
/** 每一列之间的间距 */
@property(nonatomic,assign)CGFloat columnMargin;
/** 每一行之间的间距 */
@property(nonatomic,assign)CGFloat rowMargin;
/** 显示多少列 */
@property(nonatomic,assign)NSInteger  columnsCount;

@property(nonatomic,weak)id<HLWaterfallFlowLayoutDelegate>delegate;

-(instancetype)initWithColumnsCount:(NSInteger)columnsCount;
@end
