// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDMMovie.m instead.

#import "_TDMMovie.h"

const struct TDMMovieAttributes TDMMovieAttributes = {
	.full_image = @"full_image",
	.id = @"id",
	.mpaa_rating = @"mpaa_rating",
	.release_date = @"release_date",
	.release_month = @"release_month",
	.runtime = @"runtime",
	.synopsis = @"synopsis",
	.thumb = @"thumb",
	.title = @"title",
	.year = @"year",
};

const struct TDMMovieRelationships TDMMovieRelationships = {
	.actors = @"actors",
};

const struct TDMMovieFetchedProperties TDMMovieFetchedProperties = {
};

@implementation TDMMovieID
@end

@implementation _TDMMovie

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TDMMovie" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TDMMovie";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TDMMovie" inManagedObjectContext:moc_];
}

- (TDMMovieID*)objectID {
	return (TDMMovieID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"release_monthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"release_month"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"runtimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"runtime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"yearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"year"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic full_image;






@dynamic id;






@dynamic mpaa_rating;






@dynamic release_date;






@dynamic release_month;



- (int16_t)release_monthValue {
	NSNumber *result = [self release_month];
	return [result shortValue];
}

- (void)setRelease_monthValue:(int16_t)value_ {
	[self setRelease_month:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRelease_monthValue {
	NSNumber *result = [self primitiveRelease_month];
	return [result shortValue];
}

- (void)setPrimitiveRelease_monthValue:(int16_t)value_ {
	[self setPrimitiveRelease_month:[NSNumber numberWithShort:value_]];
}





@dynamic runtime;



- (int16_t)runtimeValue {
	NSNumber *result = [self runtime];
	return [result shortValue];
}

- (void)setRuntimeValue:(int16_t)value_ {
	[self setRuntime:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRuntimeValue {
	NSNumber *result = [self primitiveRuntime];
	return [result shortValue];
}

- (void)setPrimitiveRuntimeValue:(int16_t)value_ {
	[self setPrimitiveRuntime:[NSNumber numberWithShort:value_]];
}





@dynamic synopsis;






@dynamic thumb;






@dynamic title;






@dynamic year;



- (int16_t)yearValue {
	NSNumber *result = [self year];
	return [result shortValue];
}

- (void)setYearValue:(int16_t)value_ {
	[self setYear:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveYearValue {
	NSNumber *result = [self primitiveYear];
	return [result shortValue];
}

- (void)setPrimitiveYearValue:(int16_t)value_ {
	[self setPrimitiveYear:[NSNumber numberWithShort:value_]];
}





@dynamic actors;

	
- (NSMutableSet*)actorsSet {
	[self willAccessValueForKey:@"actors"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"actors"];
  
	[self didAccessValueForKey:@"actors"];
	return result;
}
	






@end
