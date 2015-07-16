//
//  TYTitlePageTabBar.m
//  TYSlidePageScrollViewDemo
//
//  Created by SunYong on 15/7/16.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "TYTitlePageTabBar.h"

@interface TYTitlePageTabBar ()
@property (nonatomic, strong) NSArray *btnArray;
@property (nonatomic, strong) UIButton *selectBtn;

@property (nonatomic, weak) UIView *horIndicator;
@end

@implementation TYTitlePageTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _textColor = [UIColor darkTextColor];
        _selectedTextColor = [UIColor redColor];
        _horIndicatorColor = [UIColor redColor];
        _horIndicatorHeight = 4;
        [self addHorIndicatorView];
    }
    return self;
}

- (instancetype)initWithTitleArray:(NSArray *)titleArray
{
    if (self = [super init]) {
        _titleArray = titleArray;
        [self addTitleBtnArray];
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    [self addTitleBtnArray];
}

#pragma mark - add subView

- (void)addHorIndicatorView
{
    UIView *horIndicator = [[UIView alloc]init];
    horIndicator.backgroundColor = _horIndicatorColor;
    [self addSubview:horIndicator];
    _horIndicator = horIndicator;
}

- (void)addTitleBtnArray
{
    if (_btnArray) {
        [self removeTitleBtnArray];
    }
    
    NSMutableArray *btnArray = [NSMutableArray arrayWithCapacity:_titleArray.count];
    for (NSInteger index = 0; index < _titleArray.count; ++index) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = index;
        [button setTitle:_titleArray[index] forState:UIControlStateNormal];
        [button setTitleColor:_textColor forState:UIControlStateNormal];
        [button setTitleColor:_selectedTextColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(tabButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [btnArray addObject:button];
        if (index == 0) {
            [self selectButton:button];
        }
    }
    _btnArray = [btnArray copy];
}

#pragma mark - private menthod

- (void)removeTitleBtnArray
{
    for (UIButton *button in _btnArray) {
        [button removeFromSuperview];
    }
    _btnArray = nil;
}

- (void)selectButton:(UIButton *)button
{
    if (_selectBtn) {
        _selectBtn.selected = NO;
    }
    _selectBtn = button;
    
    CGRect frame = _horIndicator.frame;
    frame.origin.x = CGRectGetMinX(_selectBtn.frame);
    [UIView animateWithDuration:0.2 animations:^{
        _horIndicator.frame = frame;
    }];
    _selectBtn.selected = YES;
}

#pragma mark - action method
// clicked
- (void)tabButtonClicked:(UIButton *)button
{
    [self selectButton:button];
    
    // need ourself call this method
    [self clickedPageTabBarAtIndex:button.tag];
}

#pragma mark - override method
// override
- (void)switchToPageIndex:(NSInteger)index
{
    if (index >= 0 && index < _btnArray.count) {
        [self selectButton:_btnArray[index]];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnWidth = CGRectGetWidth(self.frame)/_btnArray.count;
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    
    [_btnArray enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        button.frame = CGRectMake(idx*btnWidth, 0, btnWidth, viewHeight);
    }];
    
    NSInteger curIndex = 0;
    if (_selectBtn) {
        curIndex = [_btnArray indexOfObject:_selectBtn];
    }
    _horIndicator.frame = CGRectMake(curIndex*btnWidth, viewHeight - _horIndicatorHeight, btnWidth, _horIndicatorHeight);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
