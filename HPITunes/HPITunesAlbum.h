//
//  ITunesAlbum.h
//  HPITunes
//
//  Created by Hervé PEROTEAU on 29/03/2014.
//  Copyright (c) 2014 Hervé PEROTEAU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPITunesAlbum : NSObject


@property (nonatomic, readonly) NSString *artistName;
@property (nonatomic, readonly) NSNumber *artistId;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *urlArtwork;
@property (nonatomic, readonly) NSString *urlItunes;
@property (nonatomic, readonly) NSDate *dateRelease;
@property (nonatomic, readonly) NSInteger trackCount;

+(HPITunesAlbum *) createWithDictionary:(NSDictionary *)dico;

@end
