//
//  ViewController.m
//  TYSlidePageScrollViewDemo
//
//  Created by tanyang on 15/7/16.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "ViewController.h"
#import "TYSlidePageScrollView.h"
#import "TableViewController.h"

@interface ViewController ()<TYSlidePageScrollViewDataSource>
@property (nonatomic, weak) TYSlidePageScrollView *slidePageScrollView;
@property (nonatomic ,strong) UIButton *selectBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self addSlidePageScrollView];
    
    [self addHeaderView];
    
    [self addTabPageMenu];
    
    [self addTableView:6];
    
    [self addTableView:14];
    
    [self addTableView:18];
    
    [_slidePageScrollView reloadData];
    
    [self tabButtonClicked:_selectBtn];
}

- (void)addSlidePageScrollView
{
    TYSlidePageScrollView *slidePageScrollView = [[TYSlidePageScrollView alloc]initWithFrame:self.view.bounds];
    slidePageScrollView.dataSource = self;
    [self.view addSubview:slidePageScrollView];
    _slidePageScrollView = slidePageScrollView;
}

- (void)addHeaderView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 180)];
    imageView.image = [UIImage imageNamed:@"CYLoLi"];
    _slidePageScrollView.headerView = imageView;
}

- (void)addTabPageMenu
{
    TYBasePageTabBar *tabPageMenu = [[TYBasePageTabBar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 40)];
    tabPageMenu.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i < 3; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        CGFloat btnWidth = CGRectGetWidth(tabPageMenu.frame)/3;
        button.frame = CGRectMake(i*btnWidth, 0, btnWidth, CGRectGetHeight(tabPageMenu.frame));
        [button setTitle:[NSString stringWithFormat:@"tabIndex%d",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(tabButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [tabPageMenu addSubview:button];
        
        if (i == 0) {
            _selectBtn = button;
        }
    }
    _slidePageScrollView.pageTabBar = tabPageMenu;
}

- (void)addTableView:(NSInteger)num
{
    TableViewController *tableViewVC = [[TableViewController alloc]init];
    tableViewVC.num =num;
    // you should addChildViewController, but you can not that if you understand .
    [self addChildViewController:tableViewVC];
}

- (void)tabButtonClicked:(UIButton *)button
{
    if (_selectBtn) {
        _selectBtn.selected = NO;
    }
    button.selected = YES;
    _selectBtn = button;
    
    [_slidePageScrollView scrollToPageIndex:button.tag nimated:YES];
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
