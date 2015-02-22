//
//  ArtistCell.h
//  WikiBand
//
//  Created by Steve Hernandez on 8/16/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) UILabel *label;

- (void)setArtistName:(NSString *)name;
- (void)setAttributedArtistName:(NSAttributedString *)attributedName;


@end
