//
//  ViewController.m
//  YUNBannerDemo
//
//  Created by Orange on 4/26/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "ViewController.h"
#import "YUNBannerView.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kNavigationBarHeight  64.0
#define kBannerHeight 192.0

@interface ViewController ()<YUNBannerViewDelegate,YUNBannerViewDataSource>

@property (nonatomic, strong) YUNBannerView *banner;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控制器的automaticallyAdjustsScrollViewInsets属性为YES(default)时, 若控制器的view及其子控件有唯一的一个UIScrollView(或其子类), 那么这个UIScrollView(或其子类)会被调整内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //配置banner
    [self setupBanner];
}

- (void)setupBanner
{
    // 初始化
    self.banner = [[YUNBannerView alloc] init];
    self.banner.dataSource = self;
    self.banner.delegate = self;
    self.banner.shouldLoop = YES;
    self.banner.autoScroll = YES;
    self.banner.scrollInterval = 5.0f;
    [self.view addSubview:self.banner];
    
    // 设置frame
    self.banner.frame = CGRectMake(0,
                                   kNavigationBarHeight,
                                   kScreenWidth,
                                   kBannerHeight);
}

// 返回Banner需要显示Item(View)的个数
- (NSInteger)numberOfItemsInBanner:(YUNBannerView *)banner
{
    return self.dataArray.count;
}

// 返回Banner在不同的index所要显示的View (可以是完全自定义的view, 且无需设置frame)
- (UIView *)banner:(YUNBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    // 取出数据
    NSString *imageName = self.dataArray[index];
    
    // 创建将要显示控件
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return imageView;
}

// 返回Footer在不同状态时要显示的文字
- (NSString *)banner:(YUNBannerView *)banner titleForFooterWithState:(YUNBannerFooterState)footerState
{
    if (footerState == YUNBannerFooterStateIdle) {
        return @"拖动进入下一页";
    } else if (footerState == YUNBannerFooterStateTrigger) {
        return @"释放进入下一页";
    }
    return nil;
}

#pragma mark - ZYBannerViewDelegate

// 在这里实现点击事件的处理
- (void)banner:(YUNBannerView *)banner didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld个项目", index);
}

// 在这里实现拖动footer后的事件处理
- (void)bannerFooterDidTrigger:(YUNBannerView *)banner
{
    NSLog(@"触发了footer");
}

#pragma mark Getter

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"qiong.jpg", @"qiong1.jpg", @"qiong2.jpg"];
    }
    return _dataArray;
}

@end
