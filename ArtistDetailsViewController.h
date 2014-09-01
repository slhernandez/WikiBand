//
//  ArtistDetailsViewController.h
//  WikiBand
//
//  Created by Steve Hernandez on 8/17/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

@interface ArtistDetailsViewController : UIViewController

@property (nonatomic, strong) Artist *artist;
@property (nonatomic, weak) IBOutlet UIImageView *artistDetailImage;
@property (nonatomic, weak) IBOutlet UILabel *artistLabel;
@property (nonatomic, weak) IBOutlet UITextView *artistBio;

@end
