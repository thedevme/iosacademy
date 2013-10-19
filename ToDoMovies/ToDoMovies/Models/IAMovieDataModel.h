//
//  TDMMovieDataModel.h
//  ClubRaiderNation
//
//  Created by Craig Clayton on 9/28/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IAMovieDataModel : NSObject


@property (strong, nonatomic) NSManagedObjectContext* mainContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;


+ (id)sharedManager;
- (NSString *)modelName;
- (NSString *)pathToModel;
- (NSString *)storeFileName;
- (NSString *)pathToLocalStore;
- (NSArray *)getMovies;
- (void)getMoviesFromNetwork;
-(NSFetchedResultsController *)fetchMovies;

@end
