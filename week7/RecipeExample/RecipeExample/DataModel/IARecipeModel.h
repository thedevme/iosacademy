//
//  IARecipeModel.h
//  RecipeExample
//
//  Created by Craig Clayton on 10/4/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface IARecipeModel : NSObject

+ (id) sharedDataModel;

@property (strong, nonatomic) NSManagedObjectContext* mainContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;

- (NSString *)modelName;
- (NSString *)pathToModel;
- (NSString *)storeFileName;
- (NSString *)pathToLocalStore;
- (NSArray *)findAllRecipes;

@end
