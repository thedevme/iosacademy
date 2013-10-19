//
//  TDMMovieDataModel.m
//  ClubRaiderNation
//
//  Created by Craig Clayton on 9/28/13.
//
//

#import "IAMovieDataModel.h"
#import <AFNetworking/AFNetworking.h>
#import "TDMMovie.h"
#import "TDMActor.h"


@interface IAMovieDataModel ()

@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;

- (NSString *)documentsDirectory;

@end



@implementation IAMovieDataModel

+ (id)sharedManager
{
    static IAMovieDataModel *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (NSArray*) getMovies
{
    NSFetchRequest *moviesRequest = [[NSFetchRequest alloc]initWithEntityName:@"TDMMovie"];
    NSError *error = nil;
    NSArray *results = [[self mainContext] executeFetchRequest:moviesRequest error:&error];
    
    return results;
}

-(NSFetchedResultsController *)fetchMovies
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TDMMovie"
                                              inManagedObjectContext:[self mainContext]];
    [fetchRequest setEntity:entity];
    
    // Create a sort descriptor for the request
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"release_date"
                                        ascending:YES
                                        selector:@selector(localizedCaseInsensitiveCompare:)];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    // Now create the fetched results controller
    NSFetchedResultsController *frc = [[NSFetchedResultsController alloc]
                                       initWithFetchRequest:fetchRequest
                                       managedObjectContext:[self mainContext]
                                       sectionNameKeyPath:@"release_date"
                                       cacheName:@"TDMMoviesData"];
    
    
    
    
//    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"TDMMovie"];
    NSError *error = nil;
//    
//    NSFetchedResultsController *fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[[IAMovieDataModel sharedManager] mainContext] sectionNameKeyPath:nil cacheName:@"TDMMoviesData"];
    
    [frc performFetch:&error];
    
    return frc;
}

- (void) getMoviesFromNetwork
{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/"]];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:@"/api/public/v1.0/lists/movies/in_theaters.json?apikey=f7rtrpktvyxw5eh2etyew4k7&q=&page_limit=50"
                                                      parameters:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError* error;
         NSDictionary* json = [NSJSONSerialization
                               JSONObjectWithData:responseObject
                               options:kNilOptions
                               error:&error];
         
         NSMutableArray* movies = [[NSMutableArray alloc] initWithArray:[json objectForKey:@"movies"]];
         
         [movies enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop)
          {
              TDMMovie* movie = [TDMMovie insertInManagedObjectContext:[self mainContext]];
              movie.id = [obj objectForKey:@"id"];
              movie.title = [obj objectForKey:@"title"];
              movie.mpaa_rating = [obj objectForKey:@"mpaa_rating"];
              movie.yearValue = [[obj objectForKey:@"year"] intValue];
              movie.runtimeValue = [[obj objectForKey:@"year"] intValue];
              movie.synopsis = [obj objectForKey:@"synopsis"];
              movie.thumb = [[obj objectForKey:@"posters"] objectForKey:@"thumbnail"];
              movie.full_image = [[obj objectForKey:@"posters"] objectForKey:@"original"];
              
              NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
              //2013-10-04
              [dateFormatter setDateFormat:@"yyyy-MM-dd"];
              NSDate* releaseDate = [dateFormatter dateFromString:[[obj objectForKey:@"release_dates"] objectForKey:@"theater"]];
              movie.release_date = releaseDate;
              
              
              
              
              NSArray* cast = [obj objectForKey:@"abridged_cast"];
              
              [cast enumerateObjectsUsingBlock:^(id castObj, NSUInteger index, BOOL *stop)
               {
                   TDMActor* actor = [TDMActor insertInManagedObjectContext:[self mainContext]];
                   actor.id = [castObj objectForKey:@"id"];
                   actor.name = [castObj objectForKey:@"name"];
                   actor.movie = movie;
               }];
              
              [[self mainContext] save:nil];
          }];
         
         [[NSNotificationCenter defaultCenter] postNotificationName:kMOVIES_LOAD_COMPLETE object:nil];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
    [operation start];
}



- (NSString *)modelName
{
    return @"ToDoMovies";
}

- (NSString *)pathToModel
{
    return [[NSBundle mainBundle] pathForResource:[self modelName]
                                           ofType:@"momd"];
}

- (NSString *)storeFileName
{
    return [[self modelName] stringByAppendingPathExtension:@"sqlite"];
}

- (NSString *)pathToLocalStore
{
    return [[self documentsDirectory] stringByAppendingPathExtension:[self storeFileName]];
}

- (NSString *)documentsDirectory
{
    NSString* documentsDirectory= nil;
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	documentsDirectory = [paths objectAtIndex:0];
    
	return documentsDirectory;
}


- (NSManagedObjectContext *)mainContext
{
    if (_mainContext == nil)
    {
        _mainContext = [[NSManagedObjectContext alloc] init];
        _mainContext.persistentStoreCoordinator = [self persistentStoreCoordinator];
    }
    
    return _mainContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel == nil) {
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToModel]];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:storeURL];
    }
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator == nil)
    {
        NSLog(@"SQLITE STORE PATH: %@", [self pathToLocalStore]);
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToLocalStore]];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]
                                             initWithManagedObjectModel:[self managedObjectModel]];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSError *e = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:options
                                       error:&e]) {
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:e forKey:NSUnderlyingErrorKey];
            NSString *reason = @"Could not create persistent store.";
            NSException *exc = [NSException exceptionWithName:NSInternalInconsistencyException
                                                       reason:reason
                                                     userInfo:userInfo];
            @throw exc;
        }
        
        _persistentStoreCoordinator = psc;
    }
    
    return _persistentStoreCoordinator;
}





@end
