//
//  ArtistStore.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/25/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "ArtistStore.h"

@interface ArtistStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ArtistStore

+ (instancetype)sharedStore {
    
    static ArtistStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// If a programmer calls [[ArtistStore alloc] init], let him
// know the error of his ways
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[ArtistStore sharedStore]" userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems {
    return self.privateItems;
}

/*- (Artist *)createItem {
    Artist *artist = [Artist randomArtist];
    
    [self.privateItems addObject:artist];
    
    return item;
}*/

@end
