// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDMActor.h instead.

#import <CoreData/CoreData.h>


extern const struct TDMActorAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} TDMActorAttributes;

extern const struct TDMActorRelationships {
	__unsafe_unretained NSString *movie;
} TDMActorRelationships;

extern const struct TDMActorFetchedProperties {
} TDMActorFetchedProperties;

@class TDMMovie;




@interface TDMActorID : NSManagedObjectID {}
@end

@interface _TDMActor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TDMActorID*)objectID;





@property (nonatomic, strong) NSString* id;



//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) TDMMovie *movie;

//- (BOOL)validateMovie:(id*)value_ error:(NSError**)error_;





@end

@interface _TDMActor (CoreDataGeneratedAccessors)

@end

@interface _TDMActor (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (TDMMovie*)primitiveMovie;
- (void)setPrimitiveMovie:(TDMMovie*)value;


@end
