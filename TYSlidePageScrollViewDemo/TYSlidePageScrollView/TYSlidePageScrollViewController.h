//
//  TYSlidePageScrollViewController.h
//  TYSlidePageScrollViewDemo
//
//  Created by SunYong on 15/7/17.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYSlidePageScrollView.h"

@protocol TYDisplayPageScrollViewDelegate <NSObject>

// you should implement the method, because I don't know the view you want to display
// the view need inherit UIScrollView (UITableview inherit it) ,also vertical scroll 
- (UIScrollView *)displayPageScrollView;

@end

@interface TYSlidePageScrollViewController : UIViewController<TYSlidePageScrollViewDelegate,TYSlidePageScrollViewDataSource>

@property (nonatomic, weak, readonly) TYSlidePageScrollView *slidePageScrollView;

// the viewController need conform to TYDisplayScrollViewDelegate
@property (nonatomic, strong) NSArray   *viewControllers;
@end
