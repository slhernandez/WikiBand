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
@property (nonatomic, weak) IBOutlet UILabel *artistBirthName;
@property (nonatomic, weak) IBOutlet UILabel *artistBornDate;
@property (nonatomic, weak) IBOutlet UILabel *artistOccupation;
@property (nonatomic, weak) IBOutlet UIScrollView *container;
@property (nonatomic, weak) IBOutlet UILabel *appTitle;

@end
