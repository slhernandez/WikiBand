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
    
    
    // Set UILabel on cell
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.autoresizesSubviews = YES;
    self.label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.label.font = [UIFont boldSystemFontOfSize:18];
    [self.label setTextColor:[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1.0]];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.label];
    
    
    if ([self.photo isEqualToString:@"Beck"]) {
        [self setArtistName:@"Beck"];
    } else if ([self.photo isEqualToString:@"CarrieUnderwood"]) {
        [self setArtistName:@"Carrie Underwood"];
    } else if ([self.photo isEqualToString:@"ChildishGambino"]) {
        [self setArtistName:@"Childish Gambino"];
    } else if ([self.photo isEqualToString:@"JayZ"]) {
        [self setArtistName:@"Jay Z"];
    } else if ([self.photo isEqualToString:@"JustinTimberlake"]) {
        [self setArtistName:@"Justin Timberlake"];
    } else if ([self.photo isEqualToString:@"KanyeWest"]) {
        [self setArtistName:@"Kanye West"];
    } else if ([self.photo isEqualToString:@"KatyPerry"]) {
        [self setArtistName:@"Katy Perry"];
    } else if ([self.photo isEqualToString:@"Madonna"]) {
        [self setArtistName:@"Madonna"];
    } else if ([self.photo isEqualToString:@"TheNational"]) {
        [self setArtistName:@"The National"];
    } else if ([self.photo isEqualToString:@"WillieNelson"]) {
        [self setArtistName:@"Willie Nelson"];
    }

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
