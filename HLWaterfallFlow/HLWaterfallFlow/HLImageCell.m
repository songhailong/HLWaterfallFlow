//
//  HLImageCell.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "HLImageCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@implementation HLImageCell
-(instancetype)initWithFrame:(CGRect)frame{
   // NSLog(@"赋值新的%f",frame.size.height);
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:self.PimageView];
        [self.contentView addSubview:self.deifalLable];
        //self.PimageView.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.PimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@0);
            make.bottom.mas_equalTo(-20);
            make.left.mas_equalTo(@0);
            make.right.mas_equalTo(@0);
        }];
       // NSLog(@"赋值新的%f",frame.size.height);
        [self.deifalLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.PimageView.mas_bottom).with.offset(0);
            make.left.mas_equalTo(@0);
            make.right.mas_equalTo(@0);
            make.bottom.mas_equalTo(@0);
        }];
    }
    return self;
}
-(void)setImageURL:(NSURL *)imageURL{
    _imageURL=imageURL;
    [self.PimageView sd_setImageWithURL:imageURL];
}
-(UIImageView *)PimageView{
    if (!_PimageView) {
        _PimageView=[[UIImageView alloc] init];
    }
    return _PimageView;
}
-(UILabel *)deifalLable{
    if (!_deifalLable) {
        _deifalLable=[[UILabel alloc] init];
        _deifalLable.textColor=[UIColor blackColor];
        _deifalLable.font=[UIFont systemFontOfSize:12];
        _deifalLable.numberOfLines=2;
        _deifalLable.backgroundColor=[UIColor redColor];
    }
    return _deifalLable;
}
@end
