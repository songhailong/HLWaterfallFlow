//
//  HLImage.h
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HLImage : NSObject
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, assign) CGFloat imageW;
@property (nonatomic, assign) CGFloat imageH;
@property(nonatomic,assign)CGFloat  cellH;
@property (nonatomic, copy) NSString *price;
+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic;
@end
