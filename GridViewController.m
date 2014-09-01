//
//  GridViewController.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/16/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "GridViewController.h"
#import "ArtistCell.h"
#import "ArtistDetailsViewController.h"
#import "PresentDetailTransition.h"
#import "DismissDetailTransition.h"
#import "Artist.h"

@interface GridViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic) NSArray *photos;
@property (nonatomic, strong) NSArray *artists;
@property (nonatomic) Artist *myArtist;

@end

@implementation GridViewController

- (instancetype) init {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(159.0, 159.0);
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 2.0;
    
    // Let's create an array of photos for prototyping
    self.photos = [[NSArray alloc] initWithObjects:@"Beck",
                   @"CarrieUnderwood",
                   @"ChildishGambino",
                   @"JayZ",
                   @"JustinTimberlake",
                   @"KanyeWest",
                   @"KatyPerry",
                   @"Madonna",
                   @"TheNational",
                   @"WillieNelson", nil];
    
    NSLog(@"Photos arrary: %@", self.photos);
    _artists = [Artist artistItems];
    NSLog(@"_artists ... %@", _artists);
    
    return (self = [super initWithCollectionViewLayout:layout]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WikiBand";
    
    [self.collectionView registerClass:[ArtistCell class] forCellWithReuseIdentifier:@"photo"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return [self.photos count];
    return [self.artists count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ArtistCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    //cell.photo = self.photos[indexPath.row];
    
    Artist *currentArtist = self.artists[indexPath.row];
    NSLog(@"artistImage ... %@", currentArtist.artistImage);
    NSLog(@"artistName ... %@", currentArtist.artistName);
    NSLog(@"artistBio ... %@", currentArtist.artistBio);
    
    cell.imageView.image = currentArtist.artistImage;
    [cell setArtistName:currentArtist.artistName];
    
    
    
    return cell;
    
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get a pointer to an object that represents the app bundle
    NSBundle *appBundle = [NSBundle mainBundle];
    // Look in the appBundle for the file ArtistDetailsViewController.xib
    ArtistDetailsViewController *advc = [[ArtistDetailsViewController alloc] initWithNibName:@"ArtistDetailsViewController" bundle:appBundle];
    Artist *selectedArtist = self.artists[indexPath.row];
    
    advc.artist = selectedArtist;
    
    advc.modalPresentationStyle = UIModalPresentationCustom;
    advc.transitioningDelegate = self;
    [self presentViewController:advc animated:YES completion: nil];
    //[self.navigationController pushViewController:advc animated:YES];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[PresentDetailTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[DismissDetailTransition alloc] init];
    
}

@end
