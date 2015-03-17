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

@interface ExperimentViewController ()
@property (nonatomic, strong) NSDictionary *labelNameAttributes;
@property (nonatomic, strong) NSDictionary *valueNameAttributes;

@end

@implementation ExperimentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    // SETUP add the close button
    // ---------------------------
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 25.0, 15.0, 15.0);
    [closeButton setHitTestEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];
    closeButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:closeButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
