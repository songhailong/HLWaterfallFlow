//
//  ViewController.m
//  HLWaterfallFlow
//
//  Created by 靓萌服饰靓萌服饰 on 2018/8/22.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

#import "ViewController.h"
#import "HLImage.h"
#import "HLImageCell.h"
#import "HMWaterflowLayout.h"
#import "HLWaterLayout.h"
#import "XRWaterfallLayout.h"
#import "XRCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,HLWaterfallFlowLayoutDelegate,HMWaterflowLayoutDelegate,XRWaterfallLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray <HLImage *>*images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XRWaterfallLayout *waterfall=[[XRWaterfallLayout alloc] initWithColumnCount:2];
    waterfall.delegate=self;
    //或者一次性设置
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfall];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[HLImageCell class] forCellWithReuseIdentifier:@"cell"];
   // [self.collectionView registerNib:[UINib nibWithNibName:@"XRCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate=self;
    
    [self.view addSubview:self.collectionView];
}

- (NSMutableArray *)images {
    //从plist文件中取出字典数组，并封装成对象模型，存入模型数组中
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            HLImage *image = [HLImage imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}
//- (void)loadMoreShops
//{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSArray *shopArray = [HLImage objectArrayWithFilename:@"1.plist"];
//        [self.images addObjectsFromArray:shopArray];
//        [self.collectionView reloadData];
//        [self.collectionView footerEndRefreshing];
//    });
//}
////根据item的宽度与indexPath计算每一个item的高度
//- (CGFloat)waterfallLayout:(HLWaterLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
//    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
//    HLImage *image = self.images[indexPath.item];
//    return image.imageH / image.imageW * itemWidth+20;
//}
//-(CGFloat)waterflowLayout:(HMWaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath{
//    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
//    HLImage *image = self.images[indexPath.item];
//    return image.imageH / image.imageW *width;
//}

-(CGFloat)waterfallLayout:(XRWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath{
    HLImage *image = self.images[indexPath.item];
      return image.imageH / image.imageW *itemWidth;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //NSLog(@"%zd",self.images.count);
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   HLImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //cell.PimageView.backgroundColor=[UIColor greenColor];

    cell.imageURL = self.images[indexPath.item].imageURL;
    cell.backgroundColor=[UIColor blackColor];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
