// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Ingredient.h instead.

#import <CoreData/CoreData.h>


extern const struct IngredientAttributes {
	__unsafe_unretained NSString *name;
} IngredientAttributes;

extern const struct IngredientRelationships {
	__unsafe_unretained NSString *recipe;
} IngredientRelationships;

extern const struct IngredientFetchedProperties {
} IngredientFetchedProperties;

@class Recipe;



@interface IngredientID : NSManagedObjectID {}
@end

@interface _Ingredient : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (IngredientID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Recipe *recipe;

//- (BOOL)validateRecipe:(id*)value_ error:(NSError**)error_;





@end

@interface _Ingredient (CoreDataGeneratedAccessors)

@end

@interface _Ingredient (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (Recipe*)primitiveRecipe;
- (void)setPrimitiveRecipe:(Recipe*)value;


@end
