//
//  MediaItems.m
//  WikiBand
//
//  Created by Steve Hernandez on 3/26/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import "MediaItems.h"

@implementation MediaItems

- (instancetype)init {
    self = [super init];
    if(self) {
        // set up the dictionary
        //NSDictionary *mediaItem = @{@"someKey": @"someValue"};
    }
    return self;
}

- (instancetype)initWithMediaItem:(NSString *)mediaName
                         image:(UIImage *)mediaAlbumArt
{
    
    self = [super init];
    if (self != nil) {
        _mediaName = [mediaName copy];
        _mediaAlbumArt = mediaAlbumArt;
}
    
    return self;
}


@end
