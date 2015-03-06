//
//  ADetailsViewController.m
//  WikiBand
//
//  Created by Steve Hernandez on 3/5/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import "ADetailsViewController.h"
#import "Artist.h"
#import "UIButton+Extensions.h"

@interface ADetailsViewController ()
@property (nonatomic, strong) NSDictionary *heroTitleAttributes;
@property (nonatomic, strong) NSDictionary *labelNameAttributes;
@property (nonatomic, strong) NSDictionary *valueNameAttributes;
@end

@implementation ADetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // SETUP SCROLL VIEW ACTIONS
    // -----------------------------
    self.detailsScrollView.delegate = self;
    self.detailsScrollView.clipsToBounds = self;
    self.detailsScrollView.bounces = YES;
    
    
    // Setup artist class for artist contents
    // ---------------------------------------
    Artist *artist = self.artist;
    
    
    // SETUP the artist image view
    // -----------------------------
    self.artistHeroImage.image = artist.artistDetailImage;
    self.artistHeroImage.contentMode = UIViewContentModeScaleAspectFill;
    
    
    // Add image gradient to hero layer
    // ---------------------------------
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.artistHeroImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor]];
    [self.artistHeroImage.layer insertSublayer:gradient atIndex:0];
    
    
    // SETUP add the close button
    // ---------------------------
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 25.0, 15.0, 15.0);
    [closeButton setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];
    [self.view addSubview:closeButton];
    
    [self.detailsScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds),600.0f)];
    
    // SETUP the Artist Meta Summary Data
    // -----------------------------------
    
    self.metaContainerView.backgroundColor = [UIColor whiteColor];
    
    NSAttributedString *birthLabelAttributed = [[NSAttributedString alloc] initWithString:self.birthNameLabel.text attributes:[self labelNameAttributes]];
    self.birthNameLabel.attributedText = birthLabelAttributed;
    
    NSAttributedString *bornDateLabelAttributed = [[NSAttributedString alloc] initWithString:self.bornDateLabel.text attributes:[self labelNameAttributes]];
    self.bornDateLabel.attributedText = bornDateLabelAttributed;
    
    NSAttributedString *occupationsLabelAttributed = [[NSAttributedString alloc] initWithString:self.occupationsLabel.text attributes:[self labelNameAttributes]];
    self.occupationsLabel.attributedText = occupationsLabelAttributed;
    
    NSAttributedString *birthNameValueAttributed = [[NSAttributedString alloc] initWithString:artist.artistBirthName attributes:[self valueNameAttributes]];
    self.birthNameValue.attributedText = birthNameValueAttributed;
    
    NSAttributedString *bornDateValueAttributed = [[NSAttributedString alloc] initWithString:artist.artistBornDate attributes:[self valueNameAttributes]];
    self.bornDateValue.attributedText = bornDateValueAttributed;
    
    NSAttributedString *occupationsValueAttributed = [[NSAttributedString alloc] initWithString:artist.artistOccupation attributes:[self valueNameAttributes]];
    self.occupationsValue.attributedText = occupationsValueAttributed;
    
    [self.occupationsValue sizeToFit];
    
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = self.detailsScrollView.contentOffset.y;
    CATransform3D headerTransform = CATransform3DIdentity;
    NSLog(@"offset... %f", offset);
    
    if (offset < 0) {
        NSLog(@"pulling down");
        CGFloat headerScaleFactor = -(offset)/self.detailsScrollView.bounds.size.height;
        CGFloat headerSizevariation = ((self.detailsScrollView.bounds.size.height * (1.0 + headerScaleFactor)) - self.detailsScrollView.bounds.size.height)/2.0;
        headerTransform = CATransform3DTranslate(headerTransform, 1, headerSizevariation, 0);
        headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
        self.detailsScrollView.layer.transform = headerTransform;
    } else {
        NSLog(@"Scoll up/down");
    }
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
