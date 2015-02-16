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
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UITextView *artistBio;
@property (nonatomic, strong) UILabel *artistBirthName;
@property (nonatomic, strong) UILabel *artistBornDate;
@property (nonatomic, strong) UILabel *artistOccupation;
@property (nonatomic, strong) UIScrollView *container;


@end
