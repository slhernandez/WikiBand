//
//  MediaItems.h
//  WikiBand
//
//  Created by Steve Hernandez on 3/26/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaItems : NSObject

@property (nonatomic, copy) NSString *mediaName;
@property (nonatomic, strong) UIImage *mediaAlbumArt;

@property (nonatomic, strong) NSArray *library;

- (instancetype)initWithMediaItem:(NSString *)mediaName
                         image:(UIImage *)mediaImage;

@end
