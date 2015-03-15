//
//  ExperimentViewController.h
//  WikiBand
//
//  Created by Steve Hernandez on 3/11/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;

@interface ExperimentViewController : UIViewController

//@property (nonatomic, strong) UILabel *occupationsValue;
//@property (nonatomic, strong) UILabel *occupationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *occupationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *occupationsValue;
@property (weak, nonatomic) IBOutlet UIView *metaContainer;





@property (nonatomic, strong) Artist *artist;
@end
