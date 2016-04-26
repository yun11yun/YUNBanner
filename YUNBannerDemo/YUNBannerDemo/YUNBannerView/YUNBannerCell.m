//
//  YUNBannerCell.m
//  YUNBannerDemo
//
//  Created by Orange on 4/26/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNBannerCell.h"

@implementation YUNBannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:_imageView];
}

@end
