//
//  EDHeadlineCell.m
//
//  Created by Edward Anthony on 2/22/16.
//  Copyright © 2016 Edward Anthony. All rights reserved.
//

#import "EDHeadlineCell.h"
#import "EDHeadlineChildViewController.h"

#define kCellHeight 350.0f

@interface EDHeadlineCell () <UIPageViewControllerDataSource>
{
    NSInteger _pageIndex;
}


@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation EDHeadlineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _headlineList = [[NSArray alloc] init];
        _pageIndex = 0;
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [self.contentView addSubview:_pageViewController.view];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), kCellHeight);
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if (_pageIndex == 0) {
        return nil;
    }
    
    _pageIndex--;
    
    return [self viewControllerAtIndex:_pageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if (_pageIndex == self.headlineList.count - 1) {
        return nil;
    }
    
    _pageIndex++;
    
    return [self viewControllerAtIndex:_pageIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.headlineList.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

#pragma mark - Accessor

- (void)setHeadlineList:(NSArray *)headlineList
{
    if (_headlineList != headlineList) {
        _headlineList = headlineList;
        [self reload];
    }
}

#pragma mark -

- (void)reload {
    [self.pageViewController setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.pageViewController.dataSource = nil;
    self.pageViewController.dataSource = self;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    EDHeadlineChildViewController *childViewController =
        [[EDHeadlineChildViewController alloc] initWithHeadline:self.headlineList[index]];
    
    childViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400.0f);
    
    return childViewController;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    [self layoutIfNeeded];
    
    return CGSizeMake(CGRectGetWidth(self.contentView.frame), CGRectGetMaxY(self.pageViewController.view.frame));
}

@end
