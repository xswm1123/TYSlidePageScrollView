//
//  ViewController.m
//  TYSlidePageScrollViewDemo
//
//  Created by tanyang on 15/7/16.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"
#import "CustomView2Controller.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *detailArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _titleArray = @[@"CustomViewController",@"CustomView2Controller",@"CustomViewController",@"CustomView2Controller"];
    _detailArray = @[@" 继承自TYSlidePageScrollViewController", @" 引用TYSlidePageScrollView",@"is NO headerView",@"pageTabBarIsStopOnTop NO"];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _detailArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.detailTextLabel.text = _detailArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC = nil;
    if (indexPath.row == 0) {
        VC = [[CustomViewController alloc]init];
    }else if (indexPath.row == 1){
        VC = [[CustomView2Controller alloc]init];
        ((CustomView2Controller *)VC).pageTabBarIsStopOnTop = YES;
    }else if (indexPath.row == 2){
        VC = [[CustomViewController alloc]init];
        ((CustomViewController *)VC).isNoHeaderView = YES;
    }else if (indexPath.row == 3){
        VC = [[CustomView2Controller alloc]init];
        ((CustomView2Controller *)VC).pageTabBarIsStopOnTop = NO;
    }
    
    if (VC) {
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
