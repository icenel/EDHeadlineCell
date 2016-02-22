//
//  EDHeadline.m
//
//  Created by Edward Anthony on 2/22/16.
//  Copyright © 2016 Edward Anthony. All rights reserved.
//

#import "EDHeadline.h"

@implementation EDHeadline

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image description:(NSString *)description
{
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _desc = description;
    }
    return self;
}

@end
