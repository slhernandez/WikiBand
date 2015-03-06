//
//  ADetailsViewController.h
//  WikiBand
//
//  Created by Steve Hernandez on 3/5/15.
//  Copyright (c) 2015 Steve Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;

@interface ADetailsViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) Artist *artist;
@property (weak, nonatomic) IBOutlet UIScrollView *detailsScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *artistHeroImage;
@property (weak, nonatomic) IBOutlet UIView *heroContainerView;

@property (weak, nonatomic) IBOutlet UIView *metaContainerView;
@property (weak, nonatomic) IBOutlet UILabel *birthNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthNameValue;
@property (weak, nonatomic) IBOutlet UILabel *bornDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bornDateValue;
@property (weak, nonatomic) IBOutlet UILabel *occupationsLabel;
@property (weak, nonatomic) IBOutlet UILabel *occupationsValue;

@end
