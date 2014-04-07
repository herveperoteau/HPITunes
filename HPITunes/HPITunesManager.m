//
//  HPITunes.m
//  HPITunes
//
//  Created by Hervé PEROTEAU on 29/03/2014.
//  Copyright (c) 2014 Hervé PEROTEAU. All rights reserved.
//

#import "HPITunesManager.h"
#import <iTunesSearch/ItunesSearch.h>
#import "HPITunesAlbum.h"


@implementation HPITunesManager

+(HPITunesManager *) sharedInstance {
    
    static dispatch_once_t pred;
    static HPITunesManager *sharedInstance = nil;
    dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

-(void) setupCountryCode {

    if (self.countryCode) {
        
        [ItunesSearch sharedInstance].countryCode = self.countryCode;
    }
    
}

-(void) getAlbumsArtist:(NSString *) artist
             Completion:(ResultITunesBlock) completion {
    
    [self setupCountryCode];
    
    [self getArtistID:artist
           Completion:^(id object, NSArray *array, NSError *error) {
               
               if (error) {
                   completion (nil, nil, error);
                   return;
               }
               
               NSNumber *artistID = object;
               
               [[ItunesSearch sharedInstance] getAlbumsForArtist:artistID
                                                      limitOrNil:nil
                                                  successHandler:^(NSArray *result) {
                                                      
                                                      NSMutableArray *albums = [[NSMutableArray alloc] init];
                                                      
                                                      [result enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                                          HPITunesAlbum *album = [HPITunesAlbum createWithDictionary:obj];
                                                          [albums addObject:album];
                                                      }];
                                                      
                                                      completion (artistID, [NSArray arrayWithArray:albums], nil);
                                                  }
                                                  failureHandler:^(NSError *error) {
                                                      
                                                      completion (artistID, nil, error);
                                                  }];
           }];
}


-(void) getArtistID:(NSString *)artist
         Completion:(ResultITunesBlock) completion {
    
    [self setupCountryCode];

    [[ItunesSearch sharedInstance] getIdForArtist:artist
                                   successHandler:^(NSArray *result) {
                                       
                                       NSDictionary *dico = result[0];
                                       
                                       id artistID = dico[@"artistId"];
                                       
                                       NSLog(@"%@.getArtistID:%@ artistID=%@ (class=%@)", self.class, artist, artistID, [artistID class]);
                                       
                                       completion (artistID, nil, nil);
                                       
                                   } failureHandler:^(NSError *error) {
                                       
                                       completion (nil, nil, error);
                                   }];
}


@end
