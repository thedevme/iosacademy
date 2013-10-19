//
//  TDMMovieCell.h
//  ToDoMovies
//
//  Created by Craig Clayton on 10/18/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDMMovieCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblYear;
@property (strong, nonatomic) IBOutlet UILabel *lblRating;
@property (strong, nonatomic) IBOutlet UIImageView *imgThumb;

@end
