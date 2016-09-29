//
//  PlaceTests.m
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Place.h"
#import "Constants.h"

@interface PlaceTests : XCTestCase
@end

@implementation PlaceTests {
    NSDictionary *dic;
}


- (void)setUp {
    [super setUp];
    
    dic = @{@"note": @"",
                               @"views": @"597",
                               @"row": @"7",
                               @"seat": @"10",
                               @"section": @"219",
                               @"venue": @"Globe Life Park in Arlington",
                               @"image": @"image.jpg"};

}

- (void)tearDown {
    [super tearDown];
    dic = nil;
}


- (void)testPlace_ShouldInitializedCorrect {
    
    Place *place = [[Place alloc] initWithVenue:dic[@"venue"] section:dic[@"section"] row:dic[@"row"] seat:dic[@"seat"] note:dic[@"note"] urlImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@/wallpaper/%@", kURLBase, dic[@"image"]]] views:dic[@"views"]];

    
    assertThat(place, hasProperty(@"note", @""));
    assertThat(place, hasProperty(@"views", @"597"));
    assertThat(place, hasProperty(@"row", @"7"));
    assertThat(place, hasProperty(@"seat", @"10"));
    assertThat(place, hasProperty(@"section", @"219"));
    assertThat(place, hasProperty(@"venue", @"Globe Life Park in Arlington"));
    assertThat(place.img, is([NSURL URLWithString:[NSString stringWithFormat:@"%@/wallpaper/%@", kURLBase, @"image.jpg"]]));
}


@end
