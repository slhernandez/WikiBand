//
//  DetailsViewController.h
//  WikiBand
//
//  Created by Steven Hernandez on 2/15/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"

@class Artist;

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Artist *artist;
@property (nonatomic, strong) UIImageView *artistDetailImage;
@property (nonatomic, weak) UILabel *artistLabel;
@property (nonatomic, weak) UITextView *artistBio;
@property (nonatomic, weak) UILabel *artistBirthName;
@property (nonatomic, weak) UILabel *artistBornDate;
@property (nonatomic, weak) UILabel *artistOccupation;
@property (nonatomic, weak) UIScrollView *container;


@end
