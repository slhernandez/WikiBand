//
//  Artist.h
//  WikiBand
//
//  Created by Steve Hernandez on 8/17/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//


@interface Artist : NSObject

@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, strong) UIImage *artistImage;
@property (nonatomic, strong) UIImage *artistDetailImage;
@property (nonatomic, copy, readonly) NSString *artistBio;

+ (NSArray *)artistItems;

- (instancetype)initWithArtist:(NSString *)artistName image:(UIImage *)artistImage bio:(NSString *)artistBio image:(UIImage *)artistDetailImage;

@end
