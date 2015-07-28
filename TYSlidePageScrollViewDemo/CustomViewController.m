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
    
    self.viewControllers = @[[self creatViewControllerPage:0 itemNum:6],[self creatViewControllerPage:1 itemNum:16],[self creatViewControllerPage:2 itemNum:6],[self creatViewControllerPage:3 itemNum:12]];
    
    self.slidePageScrollView.pageTabBarStopOnTopHeight = _isNoHeaderView ? 0 : 20;
    
    [self addHeaderView];
    
    [self addTabPageMenu];
    
    [self addFooterView];
    
    [self.slidePageScrollView reloadData];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)addHeaderView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.slidePageScrollView.frame), 180)];
    imageView.image = [UIImage imageNamed:@"CYLoLi"];
    imageView.userInteractionEnabled = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame  = CGRectMake(10, 30, 60, 32);
    [button setTitle:@"GoBack" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(navGoBack:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 75, 100, 30)];
    label.textColor = [UIColor orangeColor];
    label.text = @"headerView";
    [imageView addSubview:label];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 105, 320, 30)];
    label1.textColor = [UIColor orangeColor];
    label1.text = @"pageTabBarStopOnTopHeight 20 ↓↓";
    [imageView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 135, 320, 30)];
    label2.textColor = [UIColor orangeColor];
    label2.text = @"pageTabBarIsStopOnTop YES ↓↓";
    [imageView addSubview:label2];
    
    self.slidePageScrollView.headerView = _isNoHeaderView ? nil : imageView;
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
    if (_isNoHeaderView) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame  = CGRectMake(CGRectGetWidth(self.slidePageScrollView.frame) - 80, 0, 60, 40);
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:@"GoBack" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(navGoBack:) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:button];
    }
    
    self.slidePageScrollView.footerView = footerView;
}

- (void)clickedPageTabBarStopOnTop:(UIButton *)button
{
    button.selected = !button.isSelected;
    self.slidePageScrollView.pageTabBarIsStopOnTop = !button.isSelected;
}

- (void)navGoBack:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIViewController *)creatViewControllerPage:(NSInteger)page itemNum:(NSInteger)num
{
    TableViewController *tableViewVC = [[TableViewController alloc]init];
    tableViewVC.itemNum = num;
    tableViewVC.page = page;
    return tableViewVC;
}

//- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView horizenScrollToPageIndex:(NSInteger)index
//{
//    // 测试 reloadData
//    TableViewController *VC = self.viewControllers[index];
//    [VC.tableView reloadData];
//}

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
