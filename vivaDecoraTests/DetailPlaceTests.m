//
//  DetailPlaceTests.m
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "DetailPlace.h"
#import "Constants.h"

@interface DetailPlaceTests : XCTestCase {
    NSDictionary *dic;
}

@end

@implementation DetailPlaceTests

- (void)setUp {
    [super setUp];
    dic = @{@"address": @"USTA Billie Jean King National Tennis Center",
                               @"average_rating": @"4.3",
                               @"city": @"New York",
                               @"country": @"United States",
                               @"name": @"Arthur Ashe Stadium",
                               @"newest_image": @"image.jpg",
                               @"state": @"New York",
                               @"sameas": @"",
                               @"stats": @""};

}

- (void)tearDown {
    [super tearDown];
    dic = nil;
}

- (void)testDetailPlace_ShouldInitializedCorrect {
    
    
    DetailPlace *detailPlace = [[DetailPlace alloc] initWithName:dic[@"name"] address:dic[@"address"] city:dic[@"city"] country:dic[@"country"] state:dic[@"state"] urlImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@/wallpaper/%@", kURLBase, dic[@"newest_image"]]] rating:dic[@"average_rating"] stats:dic[@"stats"] semeas:dic[@"sameas"]];

    
    assertThat(detailPlace, hasProperty(@"address", @"USTA Billie Jean King National Tennis Center"));
    assertThat(detailPlace, hasProperty(@"rating", @"4.3"));
    assertThat(detailPlace, hasProperty(@"city", @"New York"));
    assertThat(detailPlace, hasProperty(@"country", @"United States"));
    assertThat(detailPlace, hasProperty(@"name", @"Arthur Ashe Stadium"));
    assertThat(detailPlace.img, is([NSURL URLWithString:[NSString stringWithFormat:@"%@/wallpaper/%@", kURLBase, @"image.jpg"]]));
    assertThat(detailPlace, hasProperty(@"state", @"New York"));
    assertThat(detailPlace.sameas, nilValue());
    assertThat(detailPlace.stats, nilValue());
    
}

@end
