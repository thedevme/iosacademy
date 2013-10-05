//
//  IARecipeModel.m
//  RecipeExample
//
//  Created by Craig Clayton on 10/4/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import "IARecipeModel.h"

@interface IARecipeModel ()

@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;

- (NSString *)documentsDirectory;


@end



@implementation IARecipeModel

+ (id)sharedDataModel
{
    static IARecipeModel* __instance = nil;
    if (__instance == nil)
    {
        __instance = [[IARecipeModel alloc] init];
    }
    
    return __instance;
}

- (NSArray *)findAllRecipes
{
    NSError* error = nil;
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Recipe"
                                              inManagedObjectContext:self.mainContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    NSArray *array = [self.mainContext executeFetchRequest:request error:&error];
    
    NSLog(@"%@", array);

    return array;
}


- (NSString *)modelName
{
    return @"RecipeModel";
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
