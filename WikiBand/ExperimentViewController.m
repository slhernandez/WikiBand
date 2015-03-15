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
    
    // Do any additional setup after loading the view from its nib.
    

   
    // Programatically set the UILabel for Occupations Value
    /*UILabel *occupationsValue = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300.0f, 500.0f)];
    float textHeight = [self getHeightForText:self.artist.artistOccupation withFont:occupationsValue.font andWidth:occupationsValue.frame.size.width];
    NSLog(@"textHeight is %f", textHeight);
    occupationsValue.frame = CGRectMake(0, 0, occupationsValue.frame.size.width, textHeight);
    occupationsValue.text = self.artist.artistOccupation;
    occupationsValue.numberOfLines = 0;
    occupationsValue.backgroundColor = [UIColor redColor];
    [self.view addSubview:occupationsValue];*/

    // Programatically set the UILabel for Occupations Label
    /*UILabel *occupationsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 20.0f, 50.0f)];
    occupationsLabel.text = @"Occupation:";
    occupationsLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:occupationsLabel];*/
    
    // LABELS setup on xib
    
    NSAttributedString *occupationsLabelAttributed = [[NSAttributedString alloc] initWithString:self.occupationsLabel.text attributes:[self labelNameAttributes]];
    self.occupationsLabel.attributedText = occupationsLabelAttributed;
    //[self.occupationsValue sizeToFit];

    //self.occupationsLabel.text = @"Occupation:";
    
    
    NSAttributedString *occupationsValueAttributed = [[NSAttributedString alloc] initWithString:self.artist.artistOccupation attributes:[self valueNameAttributes]];
    self.occupationsValue.attributedText = occupationsValueAttributed;

    //self.occupationsValue.text = self.artist.artistOccupation;
    //float textHeight = [self getHeightForText:self.artist.artistOccupation
                                    // withFont:self.occupationsValue.font
                                    // andWidth:self.occupationsValue.frame.size.width];
    
    //NSLog(@"textHeight is %f", textHeight);
    //self.occupationsValue.frame = CGRectMake(0, 0, self.occupationsValue.frame.size.width, textHeight);
    //[self.view addSubview:self.occupationsValue];
    //self.occupationsLabel.numberOfLines = 0;
    
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

    
    //[self addConstraints];
}

- (void) addConstraints {
    
    [self.view removeConstraints:self.view.constraints];
    
    
    UILabel *occupationsLabel = self.occupationsLabel;
    UILabel *occupationsValue = self.occupationsValue;
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(occupationsLabel, occupationsValue);
    
    NSDictionary *metrics = @{@"width": @260.0, @"horizontalSpacing":@15.0, @"verticalSpacing":@30};
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                            @"H:|-[occupationsLabel]-horizontalSpacing-[occupationsValue]-|"
                                                                   options:NSLayoutFormatAlignAllTop
                                                                   metrics:metrics
                                                                     views:views];
    
    /*constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"H:[imageView]-horizontalSpacing-[lastName(>=width)]-|"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];*/
    
    /*constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"H:[imageView]-horizontalSpacing-[comment(>=width)]-|"
                                                           options:NSLayoutFormatAlignAllBottom
                                                           metrics:metrics
                                                             views:views]];*/
    
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"V:|-50-[occupationsLabel]"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];
    
    
    [self.view addConstraints:constraints];
    
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
