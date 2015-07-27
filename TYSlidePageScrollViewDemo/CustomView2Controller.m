//
//  CustomView2Controller.m
//  TYSlidePageScrollViewDemo
//
//  Created by SunYong on 15/7/27.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "CustomView2Controller.h"
#import "TYSlidePageScrollView.h"
#import "TableViewController.h"
#import "TYTitlePageTabBar.h"

@interface CustomView2Controller ()<TYSlidePageScrollViewDataSource>
@property (nonatomic, weak) TYSlidePageScrollView *slidePageScrollView;
@property (nonatomic ,strong) UIButton *selectBtn;
@end

@implementation CustomView2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addSlidePageScrollView];
    
    [self addHeaderView];
    
    [self addTabPageMenu];
    
    [self addFooterView];
    
    [self addTableViewWithPage:0 itemNum:6];
    
    [self addTableViewWithPage:1 itemNum:12];
    
    [self addTableViewWithPage:2 itemNum:16];
    
    [self addTableViewWithPage:3 itemNum:8];
    
    [_slidePageScrollView reloadData];
}

- (void)addSlidePageScrollView
{
    TYSlidePageScrollView *slidePageScrollView = [[TYSlidePageScrollView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64)];
    slidePageScrollView.dataSource = self;
    [self.view addSubview:slidePageScrollView];
    _slidePageScrollView = slidePageScrollView;
}

- (void)addHeaderView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 180)];
    imageView.image = [UIImage imageNamed:@"CYLoLi"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 75, 100, 30)];
    label.textColor = [UIColor orangeColor];
    label.text = @"headerView";
    [imageView addSubview:label];
    _slidePageScrollView.headerView = imageView;
}

- (void)addTabPageMenu
{
    TYTitlePageTabBar *titlePageTabBar = [[TYTitlePageTabBar alloc]initWithTitleArray:@[@"简介",@"课程",@"评论",@"答疑"]];
    titlePageTabBar.frame = CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 40);
    titlePageTabBar.backgroundColor = [UIColor lightGrayColor];
    _slidePageScrollView.pageTabBar = titlePageTabBar;
}

- (void)addFooterView
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 40)];
    footerView.backgroundColor = [UIColor orangeColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:footerView.bounds];
    lable.textColor = [UIColor whiteColor];
    lable.text = @"   footerView";
    [footerView addSubview:lable];
    _slidePageScrollView.footerView = footerView;
}

- (void)addTableViewWithPage:(NSInteger)page itemNum:(NSInteger)num
{
    TableViewController *tableViewVC = [[TableViewController alloc]init];
    tableViewVC.itemNum = num;
    tableViewVC.page = page;
    
    // don't forget addChildViewController
    [self addChildViewController:tableViewVC];
}

#pragma mark - dataSource

- (NSInteger)numberOfPageViewOnSlidePageScrollView
{
    return self.childViewControllers.count;
}

- (UIScrollView *)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView pageVerticalScrollViewForIndex:(NSInteger)index
{
    TableViewController *tableViewVC = self.childViewControllers[index];
    return tableViewVC.tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
