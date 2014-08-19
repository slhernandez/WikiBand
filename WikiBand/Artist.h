//
//  Artist.h
//  WikiBand
//
//  Created by Steve Hernandez on 8/17/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

/*- (instancetype)initWithArtistName:(NSString *)name
                       artistImage:(UIImage *)image
                         artistBio:(NSString *)bio;

+ (instancetype)initWithArtistName:(NSString *)name;*/

@property (nonatomic) NSString *artistName;
@property (nonatomic) UIImage *artistImage;
@property (nonatomic) NSString *artistBio;


@end
