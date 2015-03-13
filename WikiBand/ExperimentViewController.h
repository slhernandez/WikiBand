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
@property (weak, nonatomic) IBOutlet UILabel *occupationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *occupationsValue;

@property (nonatomic, strong) Artist *artist;
@end