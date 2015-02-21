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
    // Layout the artist name in the center of the hero image
    UIFont *customFont = [UIFont fontWithName:@"Avenir-Light" size:28]; //custom font
    self.artistLabel.text = artist.artistName;
    self.artistLabel.font = customFont;
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
    
    //self.artistBio.textContainer
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 10.0, 15.0, 15.0);
    [self.view addSubview:closeButton];

    // Descriptor Matching - Family name matching
    //UIFontDescriptor *helveticaNeueFamily = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute: @"Helvetica Neue"}];
    
    //NSArray *fontMatches = [helveticaNeueFamily matchingFontDescriptorsWithMandatoryKeys:nil];
    //NSLog(@"fontMatches ... %@", fontMatches);
    
    UIFontDescriptor *bebasNeueBold = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"BebasNeueBold"}];
    NSArray *fontMatches = [bebasNeueBold matchingFontDescriptorsWithMandatoryKeys:nil];
    NSLog(@"fontMatches ... %@", fontMatches);
    
    
    
    // Get bold font style
    UIFontDescriptor *fontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    UIFontDescriptor *boldFontDescriptor = [fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    UIFont *boldFont = [UIFont fontWithDescriptor:boldFontDescriptor size:0.0];
    
    self.artistBirthName.font = boldFont;

    
    [self.container setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 600)];
    

}

- (BOOL) checkFont:(NSString *)fontName {
    NSArray *fonts = [UIFont familyNames];
    NSUInteger index = [fonts indexOfObject:fontName];
    if (index == NSNotFound) {
        return NO;
    }
    return YES;
}

- (void)dumpAllFonts {
    for (NSString *familyName in [UIFont familyNames]) {
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"%@", fontName);
        }
    }
}

- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    
    
    
}

@end
