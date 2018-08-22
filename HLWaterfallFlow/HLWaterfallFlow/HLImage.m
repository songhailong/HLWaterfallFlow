//
//  HLImage.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "HLImage.h"

@implementation HLImage
+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic {
    HLImage *image = [[HLImage alloc] init];
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    image.price=imageDic[@"price"];
    image.cellH=image.imageH+20;
    return image;
}
@end
