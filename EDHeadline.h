//
//  EDHeadline.h
//
//  Created by Edward Anthony on 2/22/16.
//  Copyright © 2016 Edward Anthony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDHeadline : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *desc;

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image description:(NSString *)description;

@end
