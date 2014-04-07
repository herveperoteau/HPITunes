//
//  ITunesAlbum.m
//  HPITunes
//
//  Created by Hervé PEROTEAU on 29/03/2014.
//  Copyright (c) 2014 Hervé PEROTEAU. All rights reserved.
//

#import "HPITunesAlbum.h"

@interface HPITunesAlbum ()

@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSNumber *artistId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *urlArtwork;
@property (nonatomic, strong) NSString *urlItunes;
@property (nonatomic, strong) NSDate *dateRelease;
@property (nonatomic, assign) NSInteger trackCount;

@end

@implementation HPITunesAlbum

+(HPITunesAlbum *) createWithDictionary:(NSDictionary *)dico {

    HPITunesAlbum *album = [[HPITunesAlbum alloc] init];
    
    NSLog(@"dico=%@", dico);

    //    amgArtistId = 142116;
    //    artistId = 1093360;
    //    artistName = Muse;
    //    artistViewUrl = "https://itunes.apple.com/us/artist/muse/id1093360?uo=4";
    //    artworkUrl100 = "http://a3.mzstatic.com/us/r30/Music/79/84/54/mzi.alpkhceo.100x100-75.jpg";
    //    artworkUrl60 = "http://a2.mzstatic.com/us/r30/Music/79/84/54/mzi.alpkhceo.60x60-50.jpg";
    //    collectionCensoredName = "The Resistance";
    //    collectionExplicitness = notExplicit;
    //    collectionId = 326492721;
    //    collectionName = "The Resistance";
    //    collectionPrice = "11.99";
    //    collectionType = Album;
    //    collectionViewUrl = "https://itunes.apple.com/us/album/the-resistance/id326492721?uo=4";
    //    copyright = "\U2117 2009 Warner Music UK Limited";
    //    country = USA;
    //    currency = USD;
    //    primaryGenreName = Alternative;
    //    releaseDate = "2009-09-11T07:00:00Z";
    //    trackCount = 12;
    //    wrapperType = collection;

    album.artistName = dico[@"artistName"];
    album.artistId = dico[@"artistId"];
    album.title = dico[@"collectionName"];
    album.urlArtwork = dico[@"artworkUrl100"];
    album.urlItunes = dico[@"collectionViewUrl"];
    album.dateRelease = dico[@"releaseDate"];
    album.trackCount = [(NSString *)dico[@"trackCount"] integerValue];
    
    return album;
}

-(NSString *) description {

    NSMutableString *result = [[NSMutableString alloc] init];
    
    [result appendFormat:@"Title=%@, TrackCount=%ld, Date=%@\n", self.title, (long)self.trackCount, self.dateRelease];
    [result appendFormat:@"Artist=%@, %@\n", self.artistId, self.artistName];
    [result appendFormat:@"Artwork=%@\n", self.urlArtwork];
    [result appendFormat:@"iTunes=%@\n", self.urlItunes];
    [result appendString:@"------------------------------------\n"];
    
    return result;
}

@end
