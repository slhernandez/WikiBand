//
//  ExperimentViewController.m
//  WikiBand
//
//  Created by Steve Hernandez on 3/11/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import "ExperimentViewController.h"
#import "Artist.h"
#import "UIButton+Extensions.h"

const CGFloat headerStop = 20.0;
//const CGFloat offset_B_LabelHeader = 35.0;
//const CGFloat distance_W_LabelHeader = 35.0;

@interface ExperimentViewController ()

@property (nonatomic, strong) NSDictionary *heroTitleAttributes;
@property (nonatomic, strong) NSDictionary *labelNameAttributes;
@property (nonatomic, strong) NSDictionary *valueNameAttributes;

@end

@implementation ExperimentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // SCROLLVIEW setup
    self.detailsScrollView.delegate = self;
    self.detailsScrollView.clipsToBounds = self;
    self.detailsScrollView.bounces = YES;
    
    
    // LABELS setup on xib
    
    NSAttributedString *nameLabelAttributed = [[NSAttributedString alloc] initWithString:self.nameLabel.text attributes:[self labelNameAttributes]];
    self.nameLabel.attributedText = nameLabelAttributed;
    
    NSAttributedString *nameValueAttributed = [[NSAttributedString alloc] initWithString:self.artist.artistBirthName attributes:[self valueNameAttributes]];
    self.nameValue.attributedText = nameValueAttributed;
    
    NSAttributedString *bornLabelAttributed = [[NSAttributedString alloc] initWithString:self.bornLabel.text attributes:[self labelNameAttributes]];
    self.bornLabel.attributedText = bornLabelAttributed;
    
    NSAttributedString *bornValueAttributed = [[NSAttributedString alloc] initWithString:self.artist.artistBornDate attributes:[self valueNameAttributes]];
    self.bornValue.attributedText = bornValueAttributed;
    
    NSAttributedString *occupationsLabelAttributed = [[NSAttributedString alloc] initWithString:self.occupationsLabel.text attributes:[self labelNameAttributes]];
    self.occupationsLabel.attributedText = occupationsLabelAttributed;
    
    NSAttributedString *occupationsValueAttributed = [[NSAttributedString alloc] initWithString:self.artist.artistOccupation attributes:[self valueNameAttributes]];
    self.occupationsValue.attributedText = occupationsValueAttributed;
    
    // SETUP Header UIView with artist image
    UIImageView *artistImage = [[UIImageView alloc] initWithFrame:self.header.frame];
    artistImage.image = self.artist.artistDetailImage;
    //artistImage.contentMode = UIViewContentModeScaleAspectFill;
    //self.header.backgroundColor = [UIColor blueColor];
    [self.header insertSubview:artistImage atIndex:0];
    //[self.header addSubview:artistImage];
    
    // Add image gradient to hero layer
    // ---------------------------------
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = artistImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor]];
    [artistImage.layer insertSublayer:gradient atIndex:0];

    
    // SETUP the bioTextView (UITextView)
    
    NSAttributedString *artistBioAttributed = [[NSAttributedString alloc] initWithString:self.artist.artistBio attributes:[self paragraphAttributes]];
    self.bioTextView.attributedText = artistBioAttributed;
    self.bioTextView.scrollEnabled = NO;
    // Call this function to dynamically calculate it's own height.
    [self textViewDidChange:self.bioTextView];
    
    // SETUP Artist Title
    // -------------------
    NSAttributedString *artistNameAttributed = [[NSAttributedString alloc]
                                                initWithString:[self.artist.artistName uppercaseString]
                                                attributes:[self heroTitleAttributes]];
    
    self.artistNameLabel.attributedText = artistNameAttributed;
    self.artistNameLabel.textAlignment = NSTextAlignmentCenter;
    self.artistNameLabel.adjustsFontSizeToFitWidth = YES;
    
    
    // SETUP add the close button
    // ---------------------------
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 25.0, 15.0, 15.0);
    [closeButton setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];
    //closeButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:closeButton];
    
    
    // HEIGHT CALCULATIONS
    // Figure out the total height of the view.
    NSInteger detailsHeaderHeight = self.header.frame.size.height;
    NSLog(@"detailsHeaderHeight %li", detailsHeaderHeight);
    
    // Get the height for the header / image
    NSInteger metaContainerHeight = self.metaContainer.frame.size.height;
    NSLog(@"metaContainerHeight %li", metaContainerHeight);
    
    // Get the height of the bio meta view
    NSInteger bioTextHeight = self.bioTextView.frame.size.height;
    NSLog(@"bioTextHeight %li", bioTextHeight);
    
    NSInteger totalHeight = detailsHeaderHeight + metaContainerHeight + bioTextHeight;
    NSLog(@"totalHeight %li", totalHeight);
    
    // get the height of the bioText (textView)
    
    // Not sure if this is the exact place to ensure
    // the content size for the details view fits the
    // scroll view.
    //self.detailsScrollView.backgroundColor = [UIColor blackColor];
    [self.detailsScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds), totalHeight)];
    
}

- (NSDictionary *)heroTitleAttributes {
    
    if (_heroTitleAttributes == nil) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 20.0f;
        paragraphStyle.paragraphSpacing = 10.0f;
        
        UIFont *font = [UIFont fontWithName:@"Whitney-Semibold" size:20.0f];
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowBlurRadius = 2.0f;
        shadow.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.30f];
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


/*- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = self.detailsScrollView.contentOffset.y;
    CATransform3D headerTransform = CATransform3DIdentity;
    //NSLog(@"offset... %f", offset);
    
    if (offset < 0) {
        //NSLog(@"pulling down");
        CGFloat headerScaleFactor = -(offset)/self.header.bounds.size.height;
        CGFloat headerSizevariation = ((self.header.bounds.size.height * (1.0 + headerScaleFactor)) - self.header.bounds.size.height)/2.0;
        headerTransform = CATransform3DTranslate(headerTransform, 1, headerSizevariation, 0);
        headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
        //self.detailsScrollView.layer.transform = headerTransform;
        self.header.layer.transform = headerTransform;
    } else {
        NSLog(@"Scoll up/down");
        // Header ------------------
        headerTransform = CATransform3DTranslate(headerTransform, 0, fmax(80, -offset), 0);
        
        // Label -------------------
        //CATransform3D labelTransform = CATransform3DMakeTranslation(0, fmax(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0);
        //self.detailsTitle.layer.transform = labelTransform;
        
        
    }
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Setup paragraph attributes for Biography text.
// -----------------------------------------------
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

// Dynamically calculate the height of the bioTextView.
// ----------------------------------------------------
- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
}

-(float) getHeightForText:(NSString*) text withFont:(UIFont*) font andWidth:(float) width{
    CGSize constraint = CGSizeMake(width , 20000.0f);
    CGSize title_size;
    float totalHeight;
    
    SEL selector = @selector(boundingRectWithSize:options:attributes:context:);
    if ([text respondsToSelector:selector]) {
        title_size = [text boundingRectWithSize:constraint
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{ NSFontAttributeName : font }
                                        context:nil].size;
        
        totalHeight = ceil(title_size.height);
    }
    
    CGFloat height = MAX(totalHeight, 40.0f);
    return height;
}

// Meta Data label and value attributes setup.
// Setup nice typography settings.
// --------------------------------------------
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

// Setup value name attributes for the artist meta data.
// -----------------------------------------------------
- (NSDictionary *)valueNameAttributes {
    if (_valueNameAttributes == nil) {
        UIFont *labelFont = [UIFont fontWithName:@"Whitney-Book" size:14];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5.0f;
        _valueNameAttributes = @{
                                 NSParagraphStyleAttributeName: paragraphStyle,
                                 NSFontAttributeName: labelFont,
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:0.482 green:0.533 blue:0.58 alpha:1]
                                 };
    }
    
    return _valueNameAttributes;
    
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
