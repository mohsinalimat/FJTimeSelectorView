//
//  ViewController.m
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/5.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJTimeScaleStyle.h"
#import "ViewController.h"
#import "MDMSetChildrenAgeView.h"

@interface ViewController ()
// timeSelectorView
@property (nonatomic, strong) MDMSetChildrenAgeView *setChildrenAgeView;
@end

@implementation ViewController

#pragma mark --------------- Life  Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControls];
}

#pragma mark --------------- Private Methods
- (void)setupViewControls {
    self.navigationItem.title = @"时间刻度选择器";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.setChildrenAgeView];
    self.view.backgroundColor = [UIColor whiteColor];
}


#pragma mark --------------- Getter / Setter
// timeSelectorView
- (MDMSetChildrenAgeView *)setChildrenAgeView {
    if(!_setChildrenAgeView){
        _setChildrenAgeView = [[MDMSetChildrenAgeView alloc] initWithFrame:self.view.bounds];
    }
    return  _setChildrenAgeView;
}

@end
