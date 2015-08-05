# TYSlidePageScrollView
An easy solution to page view or controllers with header and page tabbar,footer

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
* **use TYSlidePageScrollViewController**
customViewController inherit TYSlidePageScrollViewController
```objc
// on customViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewControllers = @[/*viewControllers*/];
    
    // custom method
    [self addBackNavButton];
    
    [self addHeaderView];  // self.slidePageScrollView.headerView = /*custom view*/;
    
    [self addPageTabbar]; // self.slidePageScrollView.pageTabBar = /*custom TYBasePageTabBar*/;
    
    [self addFooterView]; // _slidePageScrollView.footerView = /*custom view*/;
    
    [self.slidePageScrollView reloadData];
}
```
