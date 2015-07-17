//
//  TYSlidePageScrollView.h
//  TYSlidePageScrollViewDemo
//
//  Created by tanyang on 15/7/16.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYBasePageTabBar.h"

@class TYSlidePageScrollView;
@protocol TYSlidePageScrollViewDataSource <NSObject>

@required
// num pageViews
- (NSInteger)numberOfPageViewOnSlidePageScrollView;

// pageView need inherit UIScrollView (UITableview inherit it) ,also vertical scroll 
- (UIScrollView *)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView pageVerticalScrollViewForIndex:(NSInteger)index;

@end

@protocol TYSlidePageScrollViewDelegate <NSObject>

@optional
// horizen scroll to pageIndex, when index change will call
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView scrollToPageIndex:(NSInteger)index;

// horizen scroll any offset changes will call
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView scrollViewDidScroll:(UIScrollView *)scrollView;

// horizen scroll called when scroll view grinds to a halt
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end

@interface TYSlidePageScrollView : UIView

@property (nonatomic, weak)   id<TYSlidePageScrollViewDataSource> dataSource;
@property (nonatomic, weak)   id<TYSlidePageScrollViewDelegate> delegate;

@property (nonatomic, strong) UIView *headerView; // defult nil，don't forget set height

@property (nonatomic, strong) TYBasePageTabBar *pageTabBar; //defult nil 

@property (nonatomic, strong) UIView *footerView; // defult nil

@property (nonatomic, assign, readonly) NSInteger curPageIndex;

// 当滚动到scroll宽度的百分之多少 改变index 
@property (nonatomic, assign) CGFloat changeToNextIndexWhenScrollToWidthOfPercent; // 0.0~0.1 default 0.5, when scroll to half of width, change to next index


- (void)reloadData;

- (void)scrollToPageIndex:(NSInteger)index nimated:(BOOL)animated;

- (UIScrollView *)pageScrollViewForIndex:(NSInteger)index;

- (NSInteger)indexOfPageScrollView:(UIScrollView *)pageScrollView;

@end
