//
//  ArtistDetailsViewController.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/17/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "ArtistDetailsViewController.h"
#import "Artist.h"

@implementation ArtistDetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Artist *artist = self.artist;
    self.artistLabel.text = artist.artistName;
    self.artistLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleWidth);
    //[self.artistLabel setTextColor:[UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2]];
    self.artistLabel.shadowColor = [UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2];
    self.artistLabel.shadowOffset = CGSizeMake(1,1);
    self.artistLabel.textAlignment = NSTextAlignmentCenter;
    self.artistLabel.adjustsFontSizeToFitWidth = YES;
     
    // Set UILabel on cell
    //self.label = [[UILabel alloc] initWithFrame:self.bounds];
    //self.autoresizesSubviews = YES;
    //self.label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    //self.label.font = [UIFont boldSystemFontOfSize:18];
    //[self.label setTextColor:[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1.0]];
    
    //self.label.shadowColor = [UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2];
    //self.label.shadowOffset = CGSizeMake(1,1);
    
    //self.label.textAlignment = NSTextAlignmentCenter;
    //self.label.adjustsFontSizeToFitWidth = YES;
    
    
    self.artistDetailImage.image = artist.artistDetailImage;
    self.artistBio.text = artist.artistBio;
    self.artistBirthName.text = artist.artistBirthName;
    self.artistBornDate.text = artist.artistBornDate;
    self.artistOccupation.text = artist.artistOccupation;
    
    //self.artistBio.


    [self.container setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 900)];
    

}



- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    
    
    
}

@end
