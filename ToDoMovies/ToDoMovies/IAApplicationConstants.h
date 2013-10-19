//
//  IAApplicationConstants.h
//  ToDoMovies
//
//  Created by Craig Clayton on 10/18/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import "DDLog.h"//;

/*!
 * @Set the global log levels and configure so that release and adhocs only log at warn and above
 */
#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif

#define kMOVIES_LOAD_COMPLETE @"IAMoviesLoadComplete"