//
//  ArtistStore.h
//  WikiBand
//
//  Created by Steve Hernandez on 8/25/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

@interface ArtistStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// Notice that this is a class method and prefixed with a + instead of a -
+ (instancetype)sharedStore;

//- (Artist *)createItem;



@end
