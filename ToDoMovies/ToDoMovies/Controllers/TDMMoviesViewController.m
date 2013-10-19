//
//  TDMMoviesViewController.m
//  ToDoMovies
//
//  Created by Craig Clayton on 10/18/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import "TDMMoviesViewController.h"
#import "TDMMovieCell.h"
#import "TDMMovie.h"
#import "JMImageCache.h"
#import "TDMHeaderView.h"
#import "TDMDetailViewController.h"

@interface TDMMoviesViewController ()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation TDMMoviesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initalize];
}

- (void)initalize
{
    [self addObservers];
    [self setDefaults];
}

- (void) setDefaults
{
    if ([[[IAMovieDataModel sharedManager] getMovies] count] == 0)
    {
        [[IAMovieDataModel sharedManager] getMoviesFromNetwork];
    }
    else
    {
        DDLogInfo(@"load complete %@", [[IAMovieDataModel sharedManager] getMovies]);
        
    }
    
    self.tableView.backgroundColor = [UIColor blackColor];
}

- (void) addObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviesLoadComplete:) name:kMOVIES_LOAD_COMPLETE object:nil];
}

- (void) moviesLoadComplete:(NSNotification *)data
{
    _fetchedResultsController = nil;
    _fetchedResultsController = [[IAMovieDataModel sharedManager] fetchMovies];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSFetchedResultsController*)fetchedResultsController
{
    if (_fetchedResultsController == nil)
    {
        _fetchedResultsController = [[IAMovieDataModel sharedManager] fetchMovies];
    }
    
    return _fetchedResultsController;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"movieCell";
    TDMMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(TDMMovieCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDMMovie* objMovie = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.lblTitle.text = objMovie.title;
    cell.lblYear.text = [NSString stringWithFormat:@"%i", objMovie.yearValue];
    cell.lblRating.text = [NSString stringWithFormat:@"Rating: %@", objMovie.mpaa_rating];
    
    cell.lblTitle.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:16.0f];
    cell.lblYear.font = [UIFont fontWithName:@"Helvetica" size:12.0f];
    cell.lblRating.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0f];
    
    
    [cell.imgThumb setImageWithURL:[NSURL URLWithString:objMovie.thumb] placeholder:[UIImage imageNamed:@""]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    
    NSDate* releaseDate = [[[sectionInfo objects] objectAtIndex:0] release_date];
    
    TDMHeaderView *headerView = [[TDMHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM dd, yyyy"];
    headerView.lblText.text = [NSString stringWithFormat:@"%@", [[formatter stringFromDate:releaseDate] uppercaseString]];
    headerView.lblText.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:14.0f];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)object
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(TDMMovieCell *)[self.tableView cellForRowAtIndexPath:indexPath] forRowAtIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"movieDetails"])
    {
        DDLogInfo(@"selected movies");
        TDMDetailViewController *vc = segue.destinationViewController;
        TDMMovie* objMovie = [self.fetchedResultsController objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        vc.objMovie = objMovie;
    }
}


@end
