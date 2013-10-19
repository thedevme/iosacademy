// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TDMActor.m instead.

#import "_TDMActor.h"

const struct TDMActorAttributes TDMActorAttributes = {
	.id = @"id",
	.name = @"name",
};

const struct TDMActorRelationships TDMActorRelationships = {
	.movie = @"movie",
};

const struct TDMActorFetchedProperties TDMActorFetchedProperties = {
};

@implementation TDMActorID
@end

@implementation _TDMActor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TDMActor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TDMActor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TDMActor" inManagedObjectContext:moc_];
}

- (TDMActorID*)objectID {
	return (TDMActorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic id;






@dynamic name;






@dynamic movie;

	






@end
