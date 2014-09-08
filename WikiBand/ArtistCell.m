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
        
        // Set UILabel on cell
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.autoresizesSubviews = YES;
        self.label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.label.font = [UIFont boldSystemFontOfSize:18];
        [self.label setTextColor:[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1.0]];
        
        self.label.shadowColor = [UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2];
        self.label.shadowOffset = CGSizeMake(1,1);
        
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:self.label];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}

- (void)setArtistName:(NSString *)name {
    self.label.text = [NSString stringWithFormat:@"%@", name];
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
