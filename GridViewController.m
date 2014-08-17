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

@interface GridViewController ()
@property (nonatomic) NSArray *photos;

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
    
    return (self = [super initWithCollectionViewLayout:layout]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WikiBand";
    
    [self.collectionView registerClass:[ArtistCell class] forCellWithReuseIdentifier:@"photo"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ArtistCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.photo = self.photos[indexPath.row];
    
    return cell;
    
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Get a pointer to an object that represents the app bundle
    NSBundle *appBundle = [NSBundle mainBundle];
    // Look in the appBundle for the file ArtistDetailsViewController.xib
    ArtistDetailsViewController *advc = [[ArtistDetailsViewController alloc] initWithNibName:@"ArtistDetailsViewController" bundle:appBundle];
    [self.navigationController pushViewController:advc animated:YES];
}

@end
