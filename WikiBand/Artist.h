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
@property (nonatomic, strong) NSString *artistBirthName;
@property (nonatomic, strong) NSString *artistBornDate;
@property (nonatomic, strong) NSString *artistOccupation;

+ (NSArray *)artistItems;

- (instancetype)initWithArtist:(NSString *)artistName
                         image:(UIImage *)artistImage
                           bio:(NSString *)artistBio
                         image:(UIImage *)artistDetailImage
                     birthName:(NSString *)artistBirthName
                          born:(NSString *)artistBornDate
                    occupation:(NSString *)artistOccupation;

@end
