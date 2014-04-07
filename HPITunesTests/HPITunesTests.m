//
//  HPITunesTests.m
//  HPITunesTests
//
//  Created by Hervé PEROTEAU on 29/03/2014.
//  Copyright (c) 2014 Hervé PEROTEAU. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HPITunesManager.h"

@interface HPITunesTests : XCTestCase

@end

@implementation HPITunesTests {
    
    dispatch_semaphore_t semaphore;
    HPITunesManager *itunesManager;
}

- (void)setUp
{
    [super setUp];
    
    semaphore = dispatch_semaphore_create(0);
    
    itunesManager = [HPITunesManager sharedInstance];
    itunesManager.countryCode = @"fr";
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testGetAlbumsMuse {
    
    [self getAlbumsArtist:@"muse"];
}

-(void) testGetAlbumsRihanna {
    
    [self getAlbumsArtist:@"Rihanna"];
}

- (void)getAlbumsArtist:(NSString *)artist {
    
    __block NSError *err;
    
    [itunesManager getAlbumsArtist:artist
                    Completion:^(id object, NSArray *array, NSError *error) {
                        
                        if (error) {
                            err = error;
                        }
                        else {
                            NSLog(@"ArtistID=%@", object);
                            
                            [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                
                                NSLog(@"Album:\n%@", obj);
                            }];
                        }
                            
                        dispatch_semaphore_signal(semaphore);
                    }];
    
    NSLog(@"wait ...");
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:20]];
    NSLog(@"wait OK");
    
    XCTAssertTrue(err==nil, @"error: %@", [err localizedDescription]);
}




@end
