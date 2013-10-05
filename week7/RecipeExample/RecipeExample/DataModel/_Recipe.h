// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Recipe.h instead.

#import <CoreData/CoreData.h>


extern const struct RecipeAttributes {
	__unsafe_unretained NSString *name;
} RecipeAttributes;

extern const struct RecipeRelationships {
	__unsafe_unretained NSString *ingredients;
} RecipeRelationships;

extern const struct RecipeFetchedProperties {
} RecipeFetchedProperties;

@class Ingredient;



@interface RecipeID : NSManagedObjectID {}
@end

@interface _Recipe : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RecipeID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *ingredients;

- (NSMutableSet*)ingredientsSet;





@end

@interface _Recipe (CoreDataGeneratedAccessors)

- (void)addIngredients:(NSSet*)value_;
- (void)removeIngredients:(NSSet*)value_;
- (void)addIngredientsObject:(Ingredient*)value_;
- (void)removeIngredientsObject:(Ingredient*)value_;

@end

@interface _Recipe (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveIngredients;
- (void)setPrimitiveIngredients:(NSMutableSet*)value;


@end
