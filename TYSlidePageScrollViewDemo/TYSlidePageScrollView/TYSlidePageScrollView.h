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

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) TYBasePageTabBar *pageTabBar;  //need inherit TYBasePageTabBar

@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, assign, readonly) NSInteger curPageIndex;


- (void)reloadData;

- (void)scrollToPageIndex:(NSInteger)index nimated:(BOOL)animated;

- (UIScrollView *)pageScrollViewForIndex:(NSInteger)index;

- (NSInteger)indexOfPageScrollView:(UIScrollView *)pageScrollView;

@end
