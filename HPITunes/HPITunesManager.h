//
//  HPITunes.h
//  HPITunes
//
//  Created by Hervé PEROTEAU on 29/03/2014.
//  Copyright (c) 2014 Hervé PEROTEAU. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResultITunesBlock)(id object, NSArray *array, NSError *error);

@interface HPITunesManager : NSObject

+(HPITunesManager *) sharedInstance;

@property (nonatomic, strong) NSString *countryCode;

/*
 Return Array of HPItunesAlbum
 */
-(void) getAlbumsArtist:(NSString *) artist
             Completion:(ResultITunesBlock) completion;


@end
