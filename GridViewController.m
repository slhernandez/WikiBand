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
#import "ADetailsViewController.h"
#import "PresentDetailTransition.h"
#import "DismissDetailTransition.h"
#import "ExperimentViewController.h"
#import "Artist.h"
#import "MediaItems.h"
#import <MediaPlayer/MediaPlayer.h>

@interface GridViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic) NSArray *photos;
@property (nonatomic, strong) NSArray *artists;
@property (nonatomic) Artist *myArtist;
@property (nonatomic, strong) NSDictionary *cellTitleAttributes;

@end

@implementation GridViewController

- (instancetype) init {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(160, 160);
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.0;
    
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
    
    //NSLog(@"Photos arrary: %@", self.photos);
    _artists = [Artist artistItems];
    //NSLog(@"_artists ... %@", _artists);
    
    return (self = [super initWithCollectionViewLayout:layout]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
     //UIFont *bebasNeueBoldFont = [UIFont fontWithName:@"BebasNeueBold" size:28];
    self.title = @"WikiBand";
    
    [self.collectionView registerClass:[ArtistCell class] forCellWithReuseIdentifier:@"photo"];
    self.collectionView.backgroundColor = [UIColor blackColor];
    self.collectionView.scrollEnabled = YES;
    self.collectionView.bounces = YES;
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
    //NSLog(@"artistImage ... %@", currentArtist.artistImage);
    //NSLog(@"artistName ... %@", currentArtist.artistName);
    //NSLog(@"artistBio ... %@", currentArtist.artistBio);
    
    /*NSMutableArray *library = [self retrieveMediaItems];
    if (library.count >0) {
        NSLog(@"GridViewController: mediaItems library %@", library);
    }*/
    
    cell.imageView.image = currentArtist.artistImage;
    //cell.label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size: 18.0f];
    
    NSAttributedString *artistNameAttributed = [[NSAttributedString alloc] initWithString:currentArtist.artistName attributes:[self cellTitleAttributes]];
    
    [cell setAttributedArtistName:artistNameAttributed];
    
    //[cell setArtistName:currentArtist.artistName];
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get a pointer to an object that represents the app bundle
    NSBundle *appBundle = [NSBundle mainBundle];
    
    // Look in the appBundle for the file ArtistDetailsViewController.xib
    //ArtistDetailsViewController *advc = [[ArtistDetailsViewController alloc] initWithNibName:@"ArtistDetailsViewController" bundle:appBundle];
    
    //ADetailsViewController *aaDetails = [[ADetailsViewController alloc] initWithNibName:@"ADetailsViewController" bundle:appBundle];
    
    ExperimentViewController *experiment = [[ExperimentViewController alloc] initWithNibName:@"ExperimentViewController" bundle:appBundle];
    
    Artist *selectedArtist = self.artists[indexPath.row];
    
    experiment.artist = selectedArtist;
    experiment.modalPresentationStyle = UIModalPresentationCustom;
    experiment.transitioningDelegate = self;
    [self presentViewController:experiment animated:YES completion:nil];
    
    //aaDetails.artist = selectedArtist;
    //aaDetails.modalPresentationStyle = UIModalPresentationCustom;
    //aaDetails.transitioningDelegate = self;
    //[self presentViewController:aaDetails animated:YES completion:nil];
    
    
    //advc.artist = selectedArtist;
    //advc.modalPresentationStyle = UIModalPresentationCustom;
    //advc.transitioningDelegate = self;
    //[self presentViewController:advc animated:YES completion: nil];
    //[self.navigationController pushViewController:advc animated:YES];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[PresentDetailTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[DismissDetailTransition alloc] init];
    
}

- (NSDictionary *)cellTitleAttributes {
    
    if (_cellTitleAttributes == nil) {
        UIFont *font = [UIFont fontWithName:@"Whitney-Book" size:20.0f];
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowBlurRadius = 2.0f;
        shadow.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.50f];
        shadow.shadowOffset = CGSizeMake(1,1);
        _cellTitleAttributes = @{
                                 NSShadowAttributeName: shadow,
                                 NSFontAttributeName: font,
                                 NSForegroundColorAttributeName: [UIColor whiteColor]
                                 };
        
    }
    
    return _cellTitleAttributes;
}

/*- (NSMutableArray *)retrieveMediaItems {
    // Let's see if we can get a list of artist from the media library
    //MPMediaQuery *fullList = [[MPMediaQuery alloc] init];
    //NSArray *mediaList = [fullList items];
    //UIImage *albumArtwork = NULL;
    //NSMutableArray *mediaItems = [[NSMutableArray alloc] init];
    
    UIImage *albumArtwork = [[UIImage alloc] init];
    NSMutableDictionary *artists = [[NSMutableDictionary alloc] init];
    MPMediaQuery *query = [MPMediaQuery artistsQuery];
    NSArray *items = [query items];
    
    for (MPMediaItem *item in items) {
        NSString *artistName = [item valueForProperty:MPMediaItemPropertyArtist];
        NSString *artwork = [item valueForProperty:MPMediaItemPropertyArtwork];
        albumArtwork = [artwork imageWithSize:CGSizeMake(250.0, 250.0)];
        if (artistName != nil & artwork != nil) {
            [artists setObject:<#(id)#> forKey:<#(id<NSCopying>)#>]
        }
        
    }
    
    
    for (MPMediaItem *song in mediaList) {
        NSString *type = [song valueForProperty:MPMedia]
        NSString *songArtist = [song valueForProperty:MPMediaItemPropertyArtist];
        MPMediaItemArtwork *artWork = [song valueForProperty:MPMediaItemPropertyArtwork];
        albumArtwork = [artWork imageWithSize:CGSizeMake(250.0, 250.0)];
        
        if (albumArtwork != nil & songArtist != nil) {
            mItem = @{@"artist": songArtist, @"albumArt": albumArtwork};
        }
        
        [mediaItems addObject:mItem];
    }
    
    //NSLog(@"mediaItem %@", mediaItems);
    MediaItems *items = [[MediaItems alloc] init];
    items.library = @[mediaItems];
    return mediaItems;

}*/


@end
