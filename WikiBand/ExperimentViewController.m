//
//  ExperimentViewController.m
//  WikiBand
//
//  Created by Steve Hernandez on 3/11/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import "ExperimentViewController.h"
#import "Artist.h"

@interface ExperimentViewController ()

@end

@implementation ExperimentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    // Programatically set the UILabel for Occupations Value
    UILabel *occupationsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300.0f, 500.0f)];
    float textHeight = [self getHeightForText:self.artist.artistOccupation withFont:occupationsLabel.font andWidth:occupationsLabel.frame.size.width];
    NSLog(@"textHeight is %f", textHeight);
    occupationsLabel.frame = CGRectMake(0, 0, occupationsLabel.frame.size.width, textHeight);
    occupationsLabel.text = self.artist.artistOccupation;
    occupationsLabel.numberOfLines = 0;
    [self.view addSubview:occupationsLabel];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
