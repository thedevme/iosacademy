//
//  TDMMovieDataModel.m
//  ClubRaiderNation
//
//  Created by Craig Clayton on 9/28/13.
//
//

#import "TDMMovieDataModel.h"



static TDMMovieDataModel *__sharedProvider = nil;

@implementation TDMMovieDataModel

+ (TDMMovieDataModel *)sharedProvider {
    
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        
        __sharedProvider = [[TDMMovieDataModel alloc] init];
        return __sharedProvider;
    });
}


@end
