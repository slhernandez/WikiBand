//
//  DetailsViewController.m
//  WikiBand
//
//  Created by Steven Hernandez on 2/15/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import "DetailsViewController.h"
#import "Artist.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    Artist *artist = self.artist;
    
    // Layout the Details Hero Image.
    UIView *heroImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    self.artistDetailImage = [[UIImageView alloc] initWithImage: artist.artistDetailImage];
    self.artistDetailImage.frame = heroImageView.bounds;
    [heroImageView addSubview:self.artistDetailImage];
    
    
    // Add Image gradient to hero layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.artistDetailImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] CGColor],
                        (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor]];
    [self.artistDetailImage.layer insertSublayer:gradient atIndex:0];
   
    //[UIColor colorWithRed:0 green:0 blue:0 alpha:1] /*#000000*/
    
    // Layout the artist name in the center of the hero image
    UIFont *customFont = [UIFont fontWithName:@"Avenir-Light" size:28]; //custom font
    
    
    CGSize artistLabelSize = [artist.artistName sizeWithAttributes:@{NSFontAttributeName: customFont}];
    //UILabel *artistLabel = [[UILabel alloc]initWithFrame:CGRectMake(91, 15, artistLabelSize.width, artistLabelSize.height)];
    
    UILabel *artistLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ceilf(artistLabelSize.width), ceilf(artistLabelSize.height))];
    
    artistLabel.text = artist.artistName;
    artistLabel.font = customFont;
    artistLabel.adjustsFontSizeToFitWidth = YES;
    artistLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1]; /*#ffffff*/
    artistLabel.textAlignment = NSTextAlignmentCenter;
    artistLabel.center = heroImageView.center;  
    
    [heroImageView addSubview:artistLabel];
    
    [self.view addSubview:heroImageView];
    
    NSLog(@"height of hero image view: %@", NSStringFromCGRect(heroImageView.frame));
    
    // Create and layout the close button.
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close-icon"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(10.0, 10.0, 15.0, 15.0);
    [self.view addSubview:closeButton];
    
    
    // Create a UIView that will house all the label info.
    UIView *labelContainer = [[UIView alloc] initWithFrame: CGRectMake(0,heroImageView.frame.size.height, heroImageView.frame.size.width, 100)];
    labelContainer.backgroundColor = [UIColor colorWithRed:0.945 green:0.949 blue:0.953 alpha:1]; /*#fafafa*/
    [self.view addSubview:labelContainer];
    
    // Create a UITextView to enclose the entire bio.
    
    // Try to calculate the height of the text that needs to be displayed.
    UIFont *bioFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    
    CGSize textSize = [artist.artistBio]
    
    self.artistBio = [[UITextView alloc] initWithFrame:CGRectMake(0, labelContainer.frame.size.height, labelContainer.frame.size.width, 200)];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    
    
    self.container = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.container.backgroundColor = [UIColor blackColor];
    self.container.scrollEnabled = YES;
    self.container.pagingEnabled = YES;
    self.container.showsVerticalScrollIndicator = YES;
    self.container.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*2);
    [self.view addSubview:self.container];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close:(id)sender{
    NSLog(@"button was clicked");
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
