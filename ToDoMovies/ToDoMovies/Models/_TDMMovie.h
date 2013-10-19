// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDMMovie.h instead.

#import <CoreData/CoreData.h>


extern const struct TDMMovieAttributes {
	__unsafe_unretained NSString *full_image;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *mpaa_rating;
	__unsafe_unretained NSString *release_date;
	__unsafe_unretained NSString *release_month;
	__unsafe_unretained NSString *runtime;
	__unsafe_unretained NSString *synopsis;
	__unsafe_unretained NSString *thumb;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *year;
} TDMMovieAttributes;

extern const struct TDMMovieRelationships {
	__unsafe_unretained NSString *actors;
} TDMMovieRelationships;

extern const struct TDMMovieFetchedProperties {
} TDMMovieFetchedProperties;

@class TDMActor;












@interface TDMMovieID : NSManagedObjectID {}
@end

@interface _TDMMovie : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TDMMovieID*)objectID;





@property (nonatomic, strong) NSString* full_image;



//- (BOOL)validateFull_image:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* id;



//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* mpaa_rating;



//- (BOOL)validateMpaa_rating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* release_date;



//- (BOOL)validateRelease_date:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* release_month;



@property int16_t release_monthValue;
- (int16_t)release_monthValue;
- (void)setRelease_monthValue:(int16_t)value_;

//- (BOOL)validateRelease_month:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* runtime;



@property int16_t runtimeValue;
- (int16_t)runtimeValue;
- (void)setRuntimeValue:(int16_t)value_;

//- (BOOL)validateRuntime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* synopsis;



//- (BOOL)validateSynopsis:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* thumb;



//- (BOOL)validateThumb:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* year;



@property int16_t yearValue;
- (int16_t)yearValue;
- (void)setYearValue:(int16_t)value_;

//- (BOOL)validateYear:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *actors;

- (NSMutableSet*)actorsSet;





@end

@interface _TDMMovie (CoreDataGeneratedAccessors)

- (void)addActors:(NSSet*)value_;
- (void)removeActors:(NSSet*)value_;
- (void)addActorsObject:(TDMActor*)value_;
- (void)removeActorsObject:(TDMActor*)value_;

@end

@interface _TDMMovie (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveFull_image;
- (void)setPrimitiveFull_image:(NSString*)value;




- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;




- (NSString*)primitiveMpaa_rating;
- (void)setPrimitiveMpaa_rating:(NSString*)value;




- (NSDate*)primitiveRelease_date;
- (void)setPrimitiveRelease_date:(NSDate*)value;




- (NSNumber*)primitiveRelease_month;
- (void)setPrimitiveRelease_month:(NSNumber*)value;

- (int16_t)primitiveRelease_monthValue;
- (void)setPrimitiveRelease_monthValue:(int16_t)value_;




- (NSNumber*)primitiveRuntime;
- (void)setPrimitiveRuntime:(NSNumber*)value;

- (int16_t)primitiveRuntimeValue;
- (void)setPrimitiveRuntimeValue:(int16_t)value_;




- (NSString*)primitiveSynopsis;
- (void)setPrimitiveSynopsis:(NSString*)value;




- (NSString*)primitiveThumb;
- (void)setPrimitiveThumb:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveYear;
- (void)setPrimitiveYear:(NSNumber*)value;

- (int16_t)primitiveYearValue;
- (void)setPrimitiveYearValue:(int16_t)value_;





- (NSMutableSet*)primitiveActors;
- (void)setPrimitiveActors:(NSMutableSet*)value;


@end
