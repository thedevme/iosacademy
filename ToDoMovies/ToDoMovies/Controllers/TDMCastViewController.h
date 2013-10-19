//
//  TDMCastViewController.h
//  ToDoMovies
//
//  Created by Craig Clayton on 10/19/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDMCastViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* arrCasts;

- (IBAction)onDoneTapped:(id)sender;

@end
