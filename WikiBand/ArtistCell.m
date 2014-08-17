//
//  ArtistCell.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/16/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "ArtistCell.h"

@implementation ArtistCell

- (void)setPhoto:(NSString *)photo {
    _photo = photo;
//    UIImage *image = [[UIImage alloc] initWithContentsOfFile:photo];
    
    UIImage *image = [UIImage imageNamed:photo];
    NSLog(@"image is now.. %@", image);
    self.imageView.image = image;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
