//
//  EDHeadlineChildViewController.h
//
//  Created by Edward Anthony on 2/22/16.
//  Copyright © 2016 Edward Anthony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDHeadline.h"

@interface EDHeadlineChildViewController : UIViewController

@property (nonatomic, strong) EDHeadline *headline;

- (instancetype)initWithHeadline:(EDHeadline *)headline;

@end
