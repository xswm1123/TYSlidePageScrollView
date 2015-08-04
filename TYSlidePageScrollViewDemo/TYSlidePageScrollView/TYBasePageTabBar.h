//
//  TYBasePageTabBar.h
//  TYSlidePageScrollViewDemo
//
//  Created by tanyang on 15/7/16.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYBasePageTabBar;
@protocol TYBasePageTabBarPrivateDelegate <NSObject>

- (void)basePageTabBar:(TYBasePageTabBar *)basePageTabBar clickedPageTabBarAtIndex:(NSInteger)index;

@end

// Fully customizable pageTabBar inherit it
@interface TYBasePageTabBar : UIView

// when clicked pageTabBar index, must /*Ourself*/ call to change TYSlidePageScrollView index
- (void)clickedPageTabBarAtIndex:(NSInteger)index;

// override, auto call ,when TYSlidePageScrollView index change, you can change pageTabBar index
- (void)switchToPageIndex:(NSInteger)index;

@end
