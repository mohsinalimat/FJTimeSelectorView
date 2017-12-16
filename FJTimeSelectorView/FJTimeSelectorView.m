//
//  FJTimeSelectorView.m
//  FJTimeSelectorDemo
//
//  Created by fjf on 2017/12/5.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJTimeScaleStyle.h"
#import "FJTimeScaleCell.h"
#import "FJTimeSelectorView.h"
#import "FJTimeScaleBlankCell.h"

@interface FJTimeSelectorView()<UICollectionViewDelegate, UICollectionViewDataSource>
// cell num
@property (nonatomic, assign) NSInteger cellNum;
// itemSize
@property (nonatomic, assign) CGSize tagItemSize;
// indicatorHeaderHeight
@property (nonatomic, assign) CGFloat indicatorHeaderHeight;
// indicatorLayerWidth
@property (nonatomic, assign) CGFloat indicatorLayerWidth;
// indicatorLayerHeight
@property (nonatomic, assign) CGFloat indicatorLayerHeight;
// indicatorLineWidth
@property (nonatomic, assign) CGFloat indicatorLineWidth;
// 指示器 view
@property (nonatomic, strong) CAShapeLayer *indicatorLayer;
// 标签 collectionView
@property (nonatomic, strong) UICollectionView *tagCollectionView;
// 标签 flowLayout
@property (nonatomic, strong) UICollectionViewFlowLayout *tagFlowLayout;
@end

@implementation FJTimeSelectorView

#pragma mark --------------- Init Methods
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViewControls];
    }
    return self;
}


#pragma mark --------------- System Delegate

#pragma mark --- UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = _cellNum + 2;
    if (_cellNum == 0) {
        count = 0;
    }
    return count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == _cellNum + 1) {
        FJTimeScaleBlankCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FJTimeScaleBlankCell class]) forIndexPath:indexPath];
        cell.indexPath = indexPath;
        cell.timeScaleStyle = self.timeScaleStyle;
        
        return cell;
    }
    FJTimeScaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FJTimeScaleCell class]) forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.timeScaleStyle = self.timeScaleStyle;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat tmpWidth = self.tagItemSize.width;
    if (indexPath.row == 0 || indexPath.row == _cellNum + 1) {
        tmpWidth = self.frame.size.width / 2.0;
    }
    else {
        NSInteger currentIndex = _timeScaleStyle.timeScaleStartValue + (indexPath.row * _timeScaleStyle.timeScaleCount * _timeScaleStyle.timeScaleUnit);
        
        CGFloat timeSacleSpacing = self.tagItemSize.width / self.timeScaleStyle.timeScaleCount;
        if (currentIndex > self.timeScaleStyle.timeScaleEndValue) {
            tmpWidth = (self.timeScaleStyle.timeScaleCount - (currentIndex - self.timeScaleStyle.timeScaleEndValue)) * timeSacleSpacing;
        }
    }
    
    return CGSizeMake(tmpWidth, self.tagItemSize.height);
}

#pragma mark --- UIScrollView Delegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self alignCenterIndicatorViewWithScrollView:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (decelerate == NO) {
      [self alignCenterIndicatorViewWithScrollView:scrollView];
    }
}


#pragma mark --------------- Private Methods

- (void)setupViewControls {
    _cellNum = 0;
    _tagItemSize = CGSizeMake(70, 80);
    _indicatorLineWidth = 1.0f;
    _indicatorLayerWidth = 7.0f;
    _indicatorLayerHeight = 30.0f;
    _indicatorHeaderHeight = 5.0f;
    [self addSubview:self.tagCollectionView];
    [self.layer addSublayer:self.indicatorLayer];
}

- (void)alignCenterIndicatorViewWithScrollView:(UIScrollView *)scrollView {
    CGFloat timeSacleSpacing = self.tagItemSize.width / self.timeScaleStyle.timeScaleCount;
    NSInteger tmpIndex = (NSInteger)roundf(scrollView.contentOffset.x / timeSacleSpacing);
    CGFloat tmpContentOffsetX = timeSacleSpacing*tmpIndex;
    [scrollView setContentOffset: CGPointMake(tmpContentOffsetX, 0) animated:YES];
    NSInteger currentValue =  self.timeScaleStyle.timeScaleStartValue + tmpIndex;
    if (self.delegate && [self.delegate respondsToSelector:@selector(timeSelectorView:currentVuale:)]) {
        [self.delegate timeSelectorView:self currentVuale:currentValue];
    }
}

// 更新 cellNum
- (void)updateCellNum {
     _cellNum = ceilf((_timeScaleStyle.timeScaleEndValue - _timeScaleStyle.timeScaleStartValue) / (_timeScaleStyle.timeScaleUnit * _timeScaleStyle.timeScaleCount * 1.0));
    [self.tagCollectionView reloadData];
}

#pragma mark --------------- Getter / Setter

- (void)setTimeScaleStyle:(FJTimeScaleStyle *)timeScaleStyle {
    _timeScaleStyle = timeScaleStyle;
    if (_timeScaleStyle) {
        
        _cellNum = ceilf((timeScaleStyle.timeScaleEndValue - timeScaleStyle.timeScaleStartValue) / (timeScaleStyle.timeScaleUnit * timeScaleStyle.timeScaleCount * 1.0));
        _tagItemSize = timeScaleStyle.timeScaleItemSize;
        _tagFlowLayout.itemSize = _tagItemSize;
        _tagCollectionView.layer.borderColor = timeScaleStyle.collectionViewBorderColor.CGColor;
        _tagCollectionView.layer.borderWidth = timeScaleStyle.collectionViewBorderWidth;
        _indicatorLineWidth = timeScaleStyle.indicatorViewLineWidth;
        _indicatorLayerWidth = timeScaleStyle.indicatorViewLayerWidth;
        _indicatorLayerHeight = timeScaleStyle.indicatorViewLayerHeight;
        _indicatorHeaderHeight = timeScaleStyle.indicatorViewHeaderHeight;
        _indicatorLayer.path = [self indicatorPath].CGPath;
        _indicatorLayer.strokeColor = timeScaleStyle.indicatorViewBackgroundColor.CGColor;
        _indicatorLayer.fillColor = _indicatorLayer.strokeColor;
         _indicatorLayer.frame = CGRectMake((self.frame.size.width - _indicatorLayerWidth)/2.0, self.frame.size.height - _indicatorLayerHeight, _indicatorLayerWidth, _indicatorLayerHeight);
        [self.tagCollectionView reloadData];
        
        __weak typeof(self) weakSelf = self;
        NSInteger tmpDifference = timeScaleStyle.timeScaleDefaultValue - timeScaleStyle.timeScaleStartValue;
        CGFloat timeSacleSpacing = self.tagItemSize.width / _timeScaleStyle.timeScaleCount;
        CGFloat tmpContentOffsetX = tmpDifference * timeSacleSpacing;
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [weakSelf.tagCollectionView setContentOffset: CGPointMake(tmpContentOffsetX, 0) animated:NO];
        });
    }
}


// 标签 flowLayout
- (UICollectionViewLayout *)tagFlowLayout {
    if (!_tagFlowLayout) {
        _tagFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _tagFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向  水平方向
        _tagFlowLayout.itemSize = self.tagItemSize;
        _tagFlowLayout.minimumLineSpacing = 0; //最小线间距
        _tagFlowLayout.minimumInteritemSpacing = 0;
    }
    return _tagFlowLayout;
}


// 标签 collectionView
- (UICollectionView *)tagCollectionView {
    if (!_tagCollectionView) {
        _tagCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:self.tagFlowLayout];
        [_tagCollectionView registerClass:[FJTimeScaleCell class] forCellWithReuseIdentifier:NSStringFromClass([FJTimeScaleCell class])];
        [_tagCollectionView registerClass:[FJTimeScaleBlankCell class] forCellWithReuseIdentifier:NSStringFromClass([FJTimeScaleBlankCell class])];
        _tagCollectionView.dataSource = self;
        _tagCollectionView.delegate = self;
        _tagCollectionView.backgroundColor = [UIColor clearColor];
        _tagCollectionView.showsHorizontalScrollIndicator = NO;//显示水平滚动指标
        _tagCollectionView.layer.borderColor = [UIColor redColor].CGColor;
        _tagCollectionView.layer.borderWidth = 1.0f;
    }
    return _tagCollectionView;
}

- (UIBezierPath *)indicatorPath {
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(_indicatorLayerWidth/2.0, 0)];
    [linePath addLineToPoint:CGPointMake(_indicatorLayerWidth, _indicatorHeaderHeight)];
    [linePath addLineToPoint:CGPointMake((_indicatorLayerWidth - _indicatorLineWidth)/2.0 + _indicatorLineWidth, _indicatorHeaderHeight)];
    [linePath addLineToPoint:CGPointMake((_indicatorLayerWidth - _indicatorLineWidth)/2.0 + _indicatorLineWidth, _indicatorLayerHeight)];
    [linePath addLineToPoint:CGPointMake((_indicatorLayerWidth - _indicatorLineWidth)/2.0, _indicatorLayerHeight)];
    [linePath addLineToPoint:CGPointMake((_indicatorLayerWidth - _indicatorLineWidth)/2.0, _indicatorHeaderHeight)];
    [linePath addLineToPoint:CGPointMake(0, _indicatorHeaderHeight)];
    [linePath closePath];
    return linePath;
}

// 指示器
- (CAShapeLayer *)indicatorLayer {
    if(!_indicatorLayer){
        _indicatorLayer = [CAShapeLayer layer];
        _indicatorLayer.lineWidth = 1;
        _indicatorLayer.strokeColor = [UIColor redColor].CGColor;
        _indicatorLayer.fillColor = _indicatorLayer.strokeColor; // 默认为blackColor
        
        _indicatorLayer.path = [self indicatorPath].CGPath;
        _indicatorLayer.frame = CGRectMake((self.frame.size.width - _indicatorLayerWidth)/2.0, self.frame.size.height - _indicatorLayerHeight, _indicatorLayerWidth, _indicatorLayerHeight);
    }
    return  _indicatorLayer;
}



@end
