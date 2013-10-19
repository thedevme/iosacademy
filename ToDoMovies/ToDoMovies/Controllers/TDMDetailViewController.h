//
//  TDMDetailViewController.h
//  ToDoMovies
//
//  Created by Craig Clayton on 10/18/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDMMovie;

@interface TDMDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgMovieFull;
@property (strong, nonatomic) TDMMovie* objMovie;

- (IBAction)onTwitterTapped:(id)sender;
- (IBAction)onFacebookTapped:(id)sender;


@end
