
//
//  WMZCustomOnePage.m
//  WMZPageController
//
//  Created by wmz on 2019/12/13.
//  Copyright © 2019 wmz. All rights reserved.
//

#import "WMZCustomOnePage.h"
#import "TopSuspensionVC.h"
#import "UIImageView+WebCache.h"
#import "UseVC.h"
@interface WMZCustomOnePage ()
@end

@implementation WMZCustomOnePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题数组
    NSArray *data = @[@"热门",@"男装",@"美妆",@"手机",@"食品",@"电器",@"鞋包",@"百货",@"女装",@"汽车",@"电脑"];
    WMZPageParam *param =
    PageParam()
    //控制器数组
    .wViewControllerSet(^UIViewController *(NSInteger index) {
        TopSuspensionVC *vc = [TopSuspensionVC new];
        vc.page = index;
        return vc;
    })
    .wTitleArrSet(data)
    .wMenuAnimalSet(PageTitleMenuAiQY)
    .wMenuDefaultIndexSet(3)
    //悬浮开启
    .wTopSuspensionSet(YES)
    //头视图y坐标从导航栏开始
    .wFromNaviSet(YES)
    //头部
    .wMenuHeadViewSet(^UIView *{
        UIView *back = [UIView new];
        back.frame = CGRectMake(0, 0, PageVCWidth, 270);
        UIImageView *image = [UIImageView new];
        [image sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576233638482&di=3ffdd857afe701f6e763c02deccb5ee9&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D3992719440%2C1178361773%26fm%3D214%26gp%3D0.jpg"]];
        image.frame = back.bounds;
        [back addSubview:image];
        return back;
    })
    ;

    self.param = param;
    
    
    //   模拟更新头部
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.param.wMenuHeadViewSet(^UIView *{
//            UIView *back = [UIView new];
//            //如果要更新隐藏顶部 高度需设为CGFLOAT_MIN 不能设为0
//            back.frame = CGRectMake(0, 0, PageVCWidth, 200);
//            UIImageView *image = [UIImageView new];
//            [image sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576232579081&di=29b77f2a5119755d3c1c3c7ce2595527&imgtype=0&src=http%3A%2F%2Fi2.bangqu.com%2Fr2%2Fnews%2F20180810%2F304a6c35725753744e48.jpg"]];
//            image.frame = back.bounds;
//            [back addSubview:image];
//            return back;
//        });
//        [self updateHeadView];
//    });
    
}

@end
