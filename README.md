# TYSlidePageScrollView

(Deprecated)

 An easy solution to page views or controllers with header and page tabbar,footer<br>
带header,footer,滑动菜单的，分页滑动的TYSlidePageScrollView

add and support auto layout ,and support InterfaceOrientation<br>
添加并且支持自动布局，以及屏幕旋转

add parallaxHeaderEffect (BOOL parallaxHeaderEffect) default NO <br>
set PanGesture can drag header vertical scroll(BOOL headerContentViewPanGestureEnabe) default NO <br>
添加弹性视差效果，优化 header 垂直滑动
## ScreenShot

![image](https://github.com/12207480/TYSlidePageScrollView/blob/master/screenshot/slidePageViewDemo.gif)

## Usage

* **use TYSlidePageScrollView**
```objc
TYSlidePageScrollView *slidePageScrollView = [[TYSlidePageScrollView alloc]initWithFrame:self.view.bounds];
    slidePageScrollView.dataSource = self;
    slidePageScrollView.delegate = self;
    [self.view addSubview:slidePageScrollView];
    _slidePageScrollView = slidePageScrollView;
    
    _slidePageScrollView.headerView = /*custom view*/;
    _slidePageScrollView.pageTabBar = /*custom TYBasePageTabBar*/;
    _slidePageScrollView.footerView = /*custom view*/;
    
    [_slidePageScrollView reloadData];
```
* **or use TYSlidePageScrollViewController**

customViewController inherit TYSlidePageScrollViewController<br>
**the viewController should conform to UIViewControllerDisplayViewDelegate**

```objc
// on customViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // the viewController need conform to UIViewControllerDisplayViewDelegate
    self.viewControllers = @[/*viewControllers*/];
    
    // custom method
    [self addBackNavButton];
    
    [self addHeaderView];  // self.slidePageScrollView.headerView = /*custom view*/;
    
    [self addPageTabbar]; // self.slidePageScrollView.pageTabBar = /*custom TYBasePageTabBar*/;
    
    [self addFooterView]; // _slidePageScrollView.footerView = /*custom view*/;
    
    [self.slidePageScrollView reloadData];
}
```
* **custom TYBasePageTabBar**
```objc
// base class ,Fully customizable pageTabBar inherit it
@interface TYBasePageTabBar : UIView

// when clicked pageTabBar index, must /*Ourself*/ call this, to change TYSlidePageScrollView index
- (void)clickedPageTabBarAtIndex:(NSInteger)index;

// override, auto call ,when TYSlidePageScrollView index change, you can change your pageTabBar index on this method
- (void)switchToPageIndex:(NSInteger)index;

@end
```
* **set default page index**
```objc
// if you want to set default page index ,you can do it on this method
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.slidePageScrollView scrollToPageIndex:/*default index*/ animated:NO];
}

```
On demo,it have more example and usage.

## Protocol

```objc
@protocol UIViewControllerDisplayViewDelegate <NSObject>

// you should implement the method, because I don't know the view you want to display
// the view need inherit UIScrollView (UITableview inherit it) ,also vertical scroll 
- (UIScrollView *)displayView;

@end
```

## Delegate

```objc
@protocol TYSlidePageScrollViewDataSource <NSObject>

@required

// num of pageViews
- (NSInteger)numberOfPageViewOnSlidePageScrollView;

// pageView need inherit UIScrollView (UITableview inherit it) ,and vertical scroll
- (UIScrollView *)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView pageVerticalScrollViewForIndex:(NSInteger)index;

@end

@protocol TYSlidePageScrollViewDelegate <NSObject>

@optional

// vertical scroll any offset changes will call
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView verticalScrollViewDidScroll:(UIScrollView *)pageScrollView;

// pageTabBar vertical scroll and state
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView pageTabBarScrollOffset:(CGFloat)offset state:(TYPageTabBarState)state;

// horizen scroll to pageIndex, when index change will call
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView horizenScrollToPageIndex:(NSInteger)index;

// horizen scroll any offset changes will call
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView horizenScrollViewDidScroll:(UIScrollView *)scrollView;

// horizen scroll Begin Dragging
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView horizenScrollViewWillBeginDragging:(UIScrollView *)scrollView;

// horizen scroll called when scroll view grinds to a halt
- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView horizenScrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end
```

### Contact
if you find bug，please pull reqeust me <br>
if you have good idea，contact me, Email:122074809@qq.com
