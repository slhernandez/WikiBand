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
    UIFont *avenirLightFont = [UIFont fontWithName:@"Avenir-Light" size:28]; //custom font
    
    self.artistLabel.text = artist.artistName;
    self.artistLabel.font = avenirLightFont;
    self.artistLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleWidth);
    //[self.artistLabel setTextColor:[UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2]];
    self.artistLabel.shadowColor = [UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2];
    self.artistLabel.shadowOffset = CGSizeMake(1,1);
    self.artistLabel.textAlignment = NSTextAlignmentCenter;
    self.artistLabel.adjustsFontSizeToFitWidth = YES;
    
    self.artistDetailImage.image = artist.artistDetailImage;
    
    NSAttributedString *artistBioAttributed = [[NSAttributedString alloc] initWithString:artist.artistBio attributes:[self paragraphAttributes]];
    //[self textViewHeightForAttributedText:artistBioAttributed andWidth:[self.view.frame.size.width]]
    self.artistBio.attributedText = artistBioAttributed;
    self.artistBirthName.text = artist.artistBirthName;
    self.artistBornDate.text = artist.artistBornDate;
    self.artistOccupation.text = artist.artistOccupation;
    
    //UIFont *bebasNeueBoldFont = [UIFont fontWithName:@"BebasNeueBold" size:28]
    //self.appTitle.text = @"WIKIBAND";
    //self.appTitle.textColor = [UIColor whiteColor];
    //self.appTitle.font = bebasNeueBoldFont;
    //UILabel *wikiBandLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    //wikiBandLabel.text = @"WIKIBAND";
    //wikiBandLabel.textColor = [UIColor whiteColor];
    //wikiBandLabel.font = bebasNeueBoldFont;
    //[self.view addSubview:wikiBandLabel];
    
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
    //UIFontDescriptor *fontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    //UIFontDescriptor *boldFontDescriptor = [fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    //UIFont *boldFont = [UIFont fontWithDescriptor:boldFontDescriptor size:0.0];
    
    //self.artistBirthName.font = boldFont;
    [self dumpAllFonts];
    
    [self.container setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 800)];
    

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

- (NSDictionary *)paragraphAttributes {
    UIFont *paragraphFont = [UIFont fontWithName:@"Avenir-Book" size:15];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = 10.0f;
    paragraphStyle.lineSpacing = 5.0f;
    paragraphStyle.paragraphSpacing = 10.0f;
    
    return @{ NSParagraphStyleAttributeName: paragraphStyle,
              NSFontAttributeName: paragraphFont
              };
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
