//
//  TDMViewController.m
//  Week3
//
//  Created by Craig Clayton on 9/7/13.
//  Copyright (c) 2013 theDevMe. All rights reserved.
//

#import "TDMViewController.h"
#import "TDMDirector.h"
#import "TDMGenre.h"
#import "TDMMovie.h"

@interface TDMViewController ()

@end

@implementation TDMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"plist"];
    NSDictionary* movies = [[NSDictionary alloc] initWithContentsOfFile:thePath];
    NSArray* arrMovies = [[NSArray alloc] initWithArray:[movies valueForKey:@"movie"]];
    
    [self createData:arrMovies];
}

/**
 *  Create Data is method that runs when view loads
 *
 *  @param data Array of movies from Plist
 */
- (void) createData:(NSArray *)data
{
    NSMutableArray* arrMoviesData = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [data count]; i++)
    {
        NSString* strGenres = [[data objectAtIndex:i] valueForKey:@"genres"];
        NSArray* genres = [strGenres componentsSeparatedByString:@","];
        NSMutableArray* arrGenres = [[NSMutableArray alloc] init];
        
        TDMMovie* movie = [[TDMMovie alloc] init];
        movie.title = [[data objectAtIndex:i] valueForKey:@"title"];
        
        for (int j = 0; j < [genres count]; j++)
        {
            TDMGenre* genre = [[TDMGenre alloc] init];
            genre.genre = [genres objectAtIndex:j];
            [arrGenres addObject:genre];
        }
        
        movie.genres = arrGenres;
        
        [arrMoviesData addObject:movie];
    }
    
    NSLog(@"%@", arrMoviesData);
    NSLog(@"%@", [[arrMoviesData objectAtIndex:0] genres]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
