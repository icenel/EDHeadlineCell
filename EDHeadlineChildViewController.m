//
//  EDHeadlineChildViewController.m
//
//  Created by Edward Anthony on 2/22/16.
//  Copyright © 2016 Edward Anthony. All rights reserved.
//

#import "EDHeadlineChildViewController.h"

#define kInset 10.0f

@interface EDHeadlineChildViewController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation EDHeadlineChildViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _imageView = [[UIImageView alloc] init];
        _descriptionLabel = [[UILabel alloc] init];
    }
    return self;
}

- (instancetype)initWithHeadline:(EDHeadline *)headline
{
    self = [self init];
    if (self) {
        self.headline = headline;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.descriptionLabel.font = [UIFont systemFontOfSize:13.0f];
    self.descriptionLabel.numberOfLines = 0;
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.descriptionLabel];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat labelContentWidth = CGRectGetWidth(self.view.frame) - 2 * kInset;
    
    self.titleLabel.frame = CGRectMake(kInset,
                                       5.0f,
                                       labelContentWidth,
                                       [self.titleLabel sizeThatFits:CGSizeMake(labelContentWidth, 0)].height);
    
    self.imageView.frame = CGRectMake(0,
                                      CGRectGetMaxY(self.titleLabel.frame) + 5.0f,
                                      CGRectGetWidth(self.view.frame),
                                      CGRectGetWidth(self.view.frame) * 0.625f);
    
    self.descriptionLabel.frame = CGRectMake(kInset,
                                             CGRectGetMaxY(self.imageView.frame) + 5.0f,
                                             CGRectGetWidth(self.view.frame) - 2 * kInset,
                                            [self.descriptionLabel sizeThatFits:CGSizeMake(labelContentWidth, 0)].height);
    
}

#pragma mark - Accessor

- (void)setHeadline:(EDHeadline *)headline
{
    if (_headline != headline) {
        _headline = headline;
        self.titleLabel.text = _headline.title;
        self.imageView.image = _headline.image;
        self.descriptionLabel.text = _headline.desc;
        
        [self viewDidLayoutSubviews]; // When called without initWithHeadline
    }
}

@end
