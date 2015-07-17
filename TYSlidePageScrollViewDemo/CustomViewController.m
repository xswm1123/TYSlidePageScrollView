//
//  CustomViewController.m
//  TYSlidePageScrollViewDemo
//
//  Created by tanyang on 15/7/17.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "CustomViewController.h"
#import "TYTitlePageTabBar.h"
#import "TableViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewControllers = @[[self creatViewControllerPage:0 itemNum:8],[self creatViewControllerPage:1 itemNum:12],[self creatViewControllerPage:2 itemNum:16],[self creatViewControllerPage:3 itemNum:12]];
    
    self.slidePageScrollView.pageTabBarStopOnTopHeight = 20;
    [self addHeaderView];
    
    [self addTabPageMenu];
    
    [self addFooterView];
    
    [self.slidePageScrollView reloadData];

}

- (void)addHeaderView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.slidePageScrollView.frame), 180)];
    imageView.image = [UIImage imageNamed:@"CYLoLi"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 75, 100, 30)];
    label.textColor = [UIColor orangeColor];
    label.text = @"headerView";
    [imageView addSubview:label];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, 320, 30)];
    label1.textColor = [UIColor orangeColor];
    label1.text = @"pageTabBarStopOnTopHeight 20 ↓↓";
    [imageView addSubview:label1];
    
    self.slidePageScrollView.headerView = imageView;
}

- (void)addTabPageMenu
{
    TYTitlePageTabBar *titlePageTabBar = [[TYTitlePageTabBar alloc]initWithTitleArray:@[@"简介",@"课程",@"评论",@"答疑"]];
    titlePageTabBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.slidePageScrollView.frame), 40);
    titlePageTabBar.backgroundColor = [UIColor lightGrayColor];
    self.slidePageScrollView.pageTabBar = titlePageTabBar;
}

- (void)addFooterView
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.slidePageScrollView.frame), 40)];
    footerView.backgroundColor = [UIColor orangeColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:footerView.bounds];
    lable.textColor = [UIColor whiteColor];
    lable.text = @"  footerView";
    [footerView addSubview:lable];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame  = CGRectMake(CGRectGetWidth(self.slidePageScrollView.frame) - 220, 0, 220, 40);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"pageTabBarIsStopOnTop YES" forState:UIControlStateNormal];
    [button setTitle:@"pageTabBarIsStopOnTop NO" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(clickedPageTabBarStopOnTop:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:button];
    
    self.slidePageScrollView.footerView = footerView;
}

- (void)clickedPageTabBarStopOnTop:(UIButton *)button
{
    button.selected = !button.isSelected;
    self.slidePageScrollView.pageTabBarIsStopOnTop = !button.isSelected;
}

- (UIViewController *)creatViewControllerPage:(NSInteger)page itemNum:(NSInteger)num
{
    TableViewController *tableViewVC = [[TableViewController alloc]init];
    tableViewVC.itemNum = num;
    tableViewVC.page = page;
    return tableViewVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
