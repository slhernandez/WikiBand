//
//  ArtistDetailsViewController.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/17/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "ArtistDetailsViewController.h"
#import "Artist.h"
#import "UIButton+Extensions.h"

@interface ArtistDetailsViewController()
@property (nonatomic, strong) NSDictionary *heroTitleAttributes;
@property (nonatomic, strong) NSDictionary *labelNameAttributes;
@property (nonatomic, strong) NSDictionary *valueNameAttributes;
@end

@implementation ArtistDetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addConstraints];
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    
    //self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]; /*#fafafa*/
    
    Artist *artist = self.artist;
    
    NSAttributedString *artistNameAttributed = [[NSAttributedString alloc] initWithString:[artist.artistName uppercaseString] attributes:[self heroTitleAttributes]];
    self.artistLabel.attributedText = artistNameAttributed;
    self.artistLabel.textAlignment = NSTextAlignmentCenter;
    self.artistLabel.adjustsFontSizeToFitWidth = YES;
    
    self.artistDetailImage.image = artist.artistDetailImage;
    
    // Add Image gradient to hero layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.artistDetailImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor]];
    [self.artistDetailImage.layer insertSublayer:gradient atIndex:0];
    
    NSAttributedString *artistBioAttributed = [[NSAttributedString alloc] initWithString:artist.artistBio attributes:[self paragraphAttributes]];
    
    self.artistBio.attributedText = artistBioAttributed;
    self.artistBio.scrollEnabled = NO;
    // Call this function to dynamically calculate it's own height.
    [self textViewDidChange:self.artistBio];
    
    NSLog(@"birth name label... %@", self.birthNameLabel.text);
    
    //self.artistMetaContainer.backgroundColor = [UIColor colorWithRed:0.945 green:0.949 blue:0.953 alpha:1];
    self.artistMetaContainer.backgroundColor = [UIColor whiteColor];
    
    NSAttributedString *birthLabelAttributed = [[NSAttributedString alloc] initWithString:self.birthNameLabel.text attributes:[self labelNameAttributes]];
    self.birthNameLabel.attributedText = birthLabelAttributed;
    
    NSAttributedString *bornLabelAttributed = [[NSAttributedString alloc] initWithString:self.bornLabel.text attributes:[self labelNameAttributes]];
    self.bornLabel.attributedText = bornLabelAttributed;
    
    NSAttributedString *occupationLabelAttributed = [[NSAttributedString alloc] initWithString:self.occupationsLabel.text attributes:[self labelNameAttributes]];
    self.occupationsLabel.attributedText = occupationLabelAttributed;

    NSAttributedString *artistBirthNameAttributed = [[NSAttributedString alloc] initWithString:artist.artistBirthName attributes:[self valueNameAttributes]];
    self.artistBirthName.attributedText = artistBirthNameAttributed;
    
    NSAttributedString *artistBornDateAttributed = [[NSAttributedString alloc] initWithString:artist.artistBornDate attributes:[self valueNameAttributes]];
    self.artistBornDate.attributedText = artistBornDateAttributed;
    
    NSAttributedString *artistOccupationAttributed = [[NSAttributedString alloc] initWithString:artist.artistOccupation attributes:[self valueNameAttributes]];
    self.artistOccupation.attributedText = artistOccupationAttributed;
    
    self.bioContainer.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]; /*#fafafa*/
    self.artistBio.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1]; /*#fafafa*/
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 10.0, 15.0, 15.0);
    [closeButton setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];
    [self.view addSubview:closeButton];

    //[self dumpAllFonts];
    
    // Calculate the heights of the three sub views that make up the details page.
    NSInteger heroHeight = self.heroContainer.frame.size.height;
    NSInteger artistMetaHeight = self.artistMetaContainer.frame.size.height;
    NSInteger bioHeight = self.artistBio.frame.size.height;
    NSInteger totalHeight = heroHeight + artistMetaHeight + bioHeight;
    
    [self.container setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds),totalHeight)];
    
    // add colored backgrounds for debugging
    self.bioContainer.backgroundColor = [UIColor blueColor];
    self.artistMetaContainer.backgroundColor = [UIColor redColor];

   
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

- (NSDictionary *)heroTitleAttributes {
    
    if (_heroTitleAttributes == nil) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10.0f;
        paragraphStyle.paragraphSpacing = 10.0f;
        
        UIFont *font = [UIFont fontWithName:@"Whitney-Semibold" size:28.0f];
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowBlurRadius = 2.0f;
        shadow.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.50f];
        shadow.shadowOffset = CGSizeMake(1,1);
        _heroTitleAttributes = @{
                                 NSParagraphStyleAttributeName: paragraphStyle,
                                 NSShadowAttributeName: shadow,
                                 NSFontAttributeName: font,
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                 };
        
    }
    
    return _heroTitleAttributes;
}


- (NSDictionary *)paragraphAttributes {
    UIFont *paragraphFont = [UIFont fontWithName:@"Whitney-Book" size:15];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = 10.0f;
    paragraphStyle.lineSpacing = 10.0f;
    paragraphStyle.paragraphSpacing = 10.0f;
    
    return @{ NSParagraphStyleAttributeName: paragraphStyle,
              NSFontAttributeName: paragraphFont
            };
}

- (NSDictionary *)labelNameAttributes {
    if (_labelNameAttributes == nil) {
        UIFont *labelFont = [UIFont fontWithName:@"Whitney-Semibold" size:14];
        _labelNameAttributes = @{
                                 NSFontAttributeName: labelFont,
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:0.482 green:0.533 blue:0.58 alpha:1]
                                 };
    }
    
    return _labelNameAttributes;
    
}

- (NSDictionary *)valueNameAttributes {
    if (_valueNameAttributes == nil) {
        UIFont *labelFont = [UIFont fontWithName:@"Whitney-Book" size:14];
        _valueNameAttributes = @{
                                 NSFontAttributeName: labelFont,
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:0.482 green:0.533 blue:0.58 alpha:1]
                                 };
    }
    
    return _valueNameAttributes;

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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)addConstraints {
    [self.view removeConstraints:self.view.constraints];
    
    UIView *bioContainer = self.bioContainer;
    UIView *artistMetaContainer = self.artistMetaContainer;
    UIView *heroContainer = self.heroContainer;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(bioContainer, artistMetaContainer, heroContainer);
    
    NSArray *constraints = [NSLayoutConstraint
                            constraintsWithVisualFormat:@"V:|-[heroContainer]-10-[artistMetaContainer]-50-[bioContainer]"
                            options:0
                            metrics:nil
                            views:views];
    
    //constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint
    //                                                          constraintsWithVisualFormat:@"V:|-10-[bioContainer]-10-|"
    //                                                          options:0
    //                                                          metrics:nil
    //                                                          views:views]];
    
    
    [self.view addConstraints:constraints];
    
}

- (void)viewDidLoad {
   
    
}

@end
