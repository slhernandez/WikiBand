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
    self.artistLabel.shadowColor = [UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.2];
    self.artistLabel.shadowOffset = CGSizeMake(1,1);
    self.artistLabel.textAlignment = NSTextAlignmentCenter;
    self.artistLabel.adjustsFontSizeToFitWidth = YES;
    
    self.artistDetailImage.image = artist.artistDetailImage;
    
    // Add Image gradient to hero layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.artistDetailImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor]];
    [self.artistDetailImage.layer insertSublayer:gradient atIndex:0];
    
    NSAttributedString *artistBioAttributed = [[NSAttributedString alloc] initWithString:artist.artistBio attributes:[self paragraphAttributes]];
    
    self.artistBio.attributedText = artistBioAttributed;
    self.artistBio.scrollEnabled = NO;
    [self textViewDidChange:self.artistBio];

    self.artistBirthName.text = artist.artistBirthName;
    self.artistBornDate.text = artist.artistBornDate;
    self.artistOccupation.text = artist.artistOccupation;
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 10.0, 15.0, 15.0);
    [self.view addSubview:closeButton];

    //[self dumpAllFonts];
    
    // Calculate the heights of the three sub views that make up the details page.
    NSInteger heroHeight = self.heroContainer.frame.size.height;
    NSLog(@"heroHeight ... %li", (long)heroHeight);
    NSInteger artistMetaHeight = self.artistMetaContainer.frame.size.height;
    NSLog(@"artistMetaHeight ... %li", (long)artistMetaHeight);
    NSInteger bioHeight = self.artistBio.frame.size.height;
    NSLog(@"bioHeight ... %li", (long)bioHeight);
    
    NSInteger totalHeight = heroHeight + artistMetaHeight + bioHeight;
    NSLog(@"totalHeight ... %li", (long)totalHeight);
    
    [self.container setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds),totalHeight)];
   
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
    UIFont *paragraphFont = [UIFont fontWithName:@"Whitney-Book" size:15];
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

- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}

- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    
    
    
}

@end
