//
//  PresentDetailTransition.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/18/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "PresentDetailTransition.h"
#import "ArtistDetailsViewController.h"

@implementation PresentDetailTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *detail = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //ArtistDetailsViewController *detail = (ArtistDetailsViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    
    
    detail.view.alpha = 0.0;
    
    CGRect frame = containerView.bounds;
    frame.origin.y += 20.0;
    frame.size.height -= 20.0;
    detail.view.frame = frame;
    
    //detail.view.frame = containerView.bounds;
    [containerView addSubview:detail.view];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        detail.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}
    

@end
