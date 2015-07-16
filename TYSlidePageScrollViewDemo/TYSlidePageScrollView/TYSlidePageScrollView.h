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

@interface TYSlidePageScrollView : UIView

@property (nonatomic, weak)   id<TYSlidePageScrollViewDataSource> dataSource;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) TYBasePageTabBar *pageTabBar;  //need inherit TYBasePageTabBar

@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, assign, readonly) NSInteger curPageIndex;


- (void)reloadData;

@end
