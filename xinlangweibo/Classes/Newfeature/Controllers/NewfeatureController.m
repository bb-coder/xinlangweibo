//
//  NewfeatureController.m
//  xinlangweibo
//
//  Created by bb_coder on 14-8-14.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "NewfeatureController.h"
#import "UIImage+FullScreen.h"
#define kCount 4
@interface NewfeatureController ()<UIScrollViewDelegate>
{
    UIPageControl * _pageControl;
}
@end

@implementation NewfeatureController

-(void)loadView
{
    //将控制器的视图设置为imageView
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage fullImageWithNamged:@"new_feature_background.png"];
    imageView.frame = [UIScreen mainScreen].applicationFrame;
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
}
#pragma mark - 添加srollview
- (void)addScrollView
{
    
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    CGSize scrollSize = scrollView.bounds.size;
    scrollView.contentSize = CGSizeMake(scrollSize.width * kCount, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    //设置图片
    for (int i = 0; i < kCount; i++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage fullImageWithNamged:[NSString stringWithFormat:@"new_feature_%d.png",i + 1]];
        imageView.frame = CGRectMake(scrollSize.width * i, 0, scrollSize.width, scrollSize.height);
        [scrollView addSubview:imageView];
        if (i == kCount - 1) {
            //添加按钮
            UIButton * finish = [UIButton buttonWithType:UIButtonTypeCustom];
            finish.center = CGPointMake(scrollSize.width * 0.5, scrollSize.height * 0.8);
            UIImage * image = [UIImage imageNamed:@"new_feature_finish_button.png"];
            finish.bounds = (CGRect){CGPointZero,image.size};
            [finish setImage:image forState:UIControlStateNormal];
            [finish setImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted.png"] forState:UIControlStateHighlighted];
            [finish addTarget:self action:@selector(clickFinishBtn:) forControlEvents:UIControlEventTouchUpInside];
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:finish];
            //添加分享share
            UIButton * share = [UIButton buttonWithType:UIButtonTypeCustom];
            share.center = CGPointMake(scrollSize.width * 0.5, finish.center.y - 50);
            image = [UIImage imageNamed:@"new_feature_share_true.png"];
            share.bounds = (CGRect){CGPointZero,image.size};
            [share setImage:image forState:UIControlStateNormal];
            [share setImage:[UIImage imageNamed:@"new_feature_share_false.png"] forState:UIControlStateSelected];
            [share addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
            share.adjustsImageWhenHighlighted = NO;
            [imageView addSubview:share];
        }
    }
}
#pragma mark -添加pagecontrol
- (void)addPageControl
{

    UIPageControl * pageControl = [[UIPageControl alloc]init];
    pageControl.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.95);
    pageControl.numberOfPages = kCount;
    pageControl.bounds = (CGRect){CGPointZero,CGSizeMake(150, 0)};
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point.png"]];
    pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point.png"]];
    [self.view addSubview:pageControl];
    _pageControl = pageControl;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //添加一个scrollView
    [self addScrollView];
    //添加pageControll
    [self addPageControl];
}

#pragma mark -按钮点击方法
#pragma mark finish点击
-(void) clickFinishBtn:(UIButton *) sender
{
    NSLog(@"进入主界面！");
}
#pragma mark share点击
- (void) clickShareBtn:(UIButton *) sender
{
    sender.selected =! sender.selected;
}

#pragma mark -scroll滚动代理
#pragma mark 监听滚动方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / self.view.bounds.size.width;
}





@end
