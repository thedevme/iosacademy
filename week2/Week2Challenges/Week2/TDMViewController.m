//
//  TDMViewController.m
//  Week2
//
//  Created by Craig Clayton on 8/30/13.
//  Copyright (c) 2013 theDevMe. All rights reserved.
//

#import "TDMViewController.h"

@interface TDMViewController ()

@end

@implementation TDMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"plist"];
    NSDictionary* movies = [[NSDictionary alloc] initWithContentsOfFile:thePath];
    NSArray* arrMovies = [[NSArray alloc] initWithArray:[movies valueForKey:@"movie"]];
    
    [self challengeOne:[arrMovies objectAtIndex:0] withPrint:NO];
    [self challengeOne:[arrMovies lastObject] withPrint:NO];
    [self challengeTwoPartOne:arrMovies withPrint:NO];
    [self challengeTwoPartTwo:arrMovies withRating:@"6" andPrint:YES];
}

/**
 *  Take the only the first Movie in the array (without using a loop) and set a local property
 *
 *  @param data  Array of movies
 *  @param print Show log in console
 */
- (void) challengeOne:(NSDictionary *)data withPrint:(BOOL)print
{
    int votes = [[data valueForKey:@"number_votes"] intValue];
    int rank = [[data valueForKey:@"rank"] intValue];
    float rating = [[data valueForKey:@"rating"] floatValue];
    int runtime = [[data valueForKey:@"runtime"] intValue];
    int year = [[data valueForKey:@"year"] intValue];
    
    //Strings
    NSString* director = [data valueForKey:@"directors"];
    NSString* link = [data valueForKey:@"link"];
    NSString* title = [data valueForKey:@"title"];
    
    
    //Numbers
    NSNumber* numVotes = [NSNumber numberWithInt:votes];
    NSNumber* numRank = [NSNumber numberWithInt:rank];
    NSNumber* numRating = [NSNumber numberWithFloat:rating];
    NSNumber* numRuntime = [NSNumber numberWithInt:runtime];
    NSNumber* numYear = [NSNumber numberWithInt:year];
    
    //Date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *releaseDate = [[NSDate alloc] init];
    
    [dateFormatter setDateFormat:@"d/mm/yyyy"];
    releaseDate = [dateFormatter dateFromString:[data valueForKey:@"release_date"]];
    
    NSString* strGenres = [data valueForKey:@"genres"];
    NSArray* genres = [strGenres componentsSeparatedByString:@","];

    if (print) NSLog(@"\ndirectors: %@ \nlink: %@ \ntitle: %@ \nvotes %i \nrank: %i \nrating: %0.1f \nruntime: %i \nyear: %i \nrelease date: %@ \ngenres:%@",
          director, link, title, [numVotes intValue], [numRank intValue], [numRating floatValue],
          [numRuntime intValue], [numYear intValue], releaseDate, genres);
}


/**
 *  Sort Movies in alphabetical order
 *
 *  @param data  Array of Movies
 *  @param print Show log in console
 */
- (void) challengeTwoPartOne:(NSArray *)data withPrint:(BOOL)print
{
    //Sort from A - Z
    NSMutableArray* arrTitles = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [data count]; i++)
    {
        NSString* title = [[data objectAtIndex:i] valueForKey:@"title"];
        [arrTitles addObject:title];
    }
    
    [arrTitles sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    if (print) NSLog(@"%@", arrTitles);
}


/**
 *  Separate every movie by rank and put into array & put
 *  them into a dictionary.
 *
 *  @param data        Array of movies
 *  @param movieRating Movies rating you want
 *  @param print       Show log in console
 */
- (void) challengeTwoPartTwo:(NSArray *)data withRating:(NSString *)movieRating andPrint:(BOOL)print
{
    NSMutableArray* arrMoviesRatingFive     = [[NSMutableArray alloc] init];
    NSMutableArray* arrMoviesRatingSix      = [[NSMutableArray alloc] init];
    NSMutableArray* arrMoviesRatingSeven    = [[NSMutableArray alloc] init];
    NSMutableArray* arrMoviesRatingEight    = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* dictMovies = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < [data count]; i++)
    {
        NSString* rating = [[data objectAtIndex:i] valueForKey:@"rating"];
        NSString* title = [[data objectAtIndex:i] valueForKey:@"title"];
        NSString* numRating = [[rating componentsSeparatedByString:@"."] objectAtIndex:0];
        
        if ([numRating isEqualToString:@"5"]) [arrMoviesRatingFive addObject:title];
        if ([numRating isEqualToString:@"6"]) [arrMoviesRatingSix addObject:title];
        if ([numRating isEqualToString:@"7"]) [arrMoviesRatingSeven addObject:title];
        if ([numRating isEqualToString:@"8"]) [arrMoviesRatingEight addObject:title];
    }
    
    [dictMovies setObject:arrMoviesRatingFive forKey:@"5"];
    [dictMovies setObject:arrMoviesRatingFive forKey:@"6"];
    [dictMovies setObject:arrMoviesRatingFive forKey:@"7"];
    [dictMovies setObject:arrMoviesRatingFive forKey:@"8"];
    
    if (print)
    {
        NSLog(@"There are %i total movies with rating 5.0 - 5.9", [arrMoviesRatingFive count]);
        NSLog(@"There are %i total movies with rating 6.0 - 6.9", [arrMoviesRatingSix count]);
        NSLog(@"There are %i total movies with rating 7.0 - 7.9", [arrMoviesRatingSeven count]);
        NSLog(@"There are %i total movies with rating 8.0 - 8.9", [arrMoviesRatingEight count]);
        
        NSLog(@"%@", [self filterMoviesByRating:dictMovies withRating:movieRating]);
    }
}


/**
 *  Filter Movies By Rating
 *
 *  @param data   dictionary of movies
 *  @param rating string value of the movie rating you want back
 *
 *  @return dictionary of movie title
 */
- (NSDictionary *)filterMoviesByRating:(NSDictionary *)data withRating:(NSString *)rating
{
    return [data valueForKey:rating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
