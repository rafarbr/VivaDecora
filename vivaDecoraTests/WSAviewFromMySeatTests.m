//
//  WSAviewFromMySeatTests.m
//  vivaDecora
//
//  Created by PH on 29/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking/AFNetworking.h>
#import <OCMock/OCMock.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Place.h"
#import "DetailPlace.h"
#import "WSAviewFromMySeat.h"

@interface WSAviewFromMySeatTests : XCTestCase {
    NSMutableDictionary *parameters;
}
@end

@implementation WSAviewFromMySeatTests

- (void)setUp {
    [super setUp];
    parameters = [NSMutableDictionary dictionary];
    NSString *appkey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"APIToken"];
    [parameters setObject:appkey forKey:@"appkey"];
}

- (void)tearDown {
    [super tearDown];
    parameters = nil;
}

- (void)testPlaceService_shouldSendCorrectRequest {
    NSString *url = [NSString stringWithFormat:@"%@/avf/api/%@", kURLBase, @"featured.php"];

    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    OCMExpect([sessionManager GET:[OCMArg checkWithBlock:^BOOL(NSString *searchUrl) {
        return [searchUrl isEqualToString:url];
    }] parameters:[OCMArg checkWithBlock:^BOOL(NSDictionary *param) {
        return [param isEqualToDictionary:parameters];
    }] progress:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]]);
               
    [WSAviewFromMySeat listWithCompletion:nil failure:nil];
    
    OCMVerifyAll(sessionManager);
}

- (void)testPlaceService_shouldInvokeSuccessCallback_whenRequestSuccess {
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    OCMStub([sessionManager GET:[OCMArg any] parameters:[OCMArg any]
                       progress:[OCMArg any]
                        success:([OCMArg invokeBlockWithArgs:[OCMArg any], [self mockedResponseDictionaryPlace], nil])
                        failure:[OCMArg any]]);
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Successfully callback"];
    
    [WSAviewFromMySeat listWithCompletion:^(NSArray<Model> *array) {
        [expecation fulfill];
        assertThat(array, allOfIn(@[hasCountOf(1), everyItem(isA([Place class]))]));

    } failure:nil];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testPlaceService_shouldInvokeFailureCallback_whenRequestFailed {
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    NSError *mockError = [NSError errorWithDomain:@"MockError" code:400 userInfo:nil];
    OCMStub([sessionManager GET:[OCMArg any] parameters:[OCMArg any]
                       progress:[OCMArg any]
                        success:[OCMArg any]
                        failure:([OCMArg invokeBlockWithArgs:[OCMArg any], mockError, nil])]);
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Successfully callback"];
    
    [WSAviewFromMySeat listWithCompletion:nil failure:^(NSError *error) {
        [expecation fulfill];
        assertThat(error, allOfIn(@[hasProperty(@"code", @(mockError.code)),
                                    hasProperty(@"domain", mockError.domain)]));

    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testDetailPlaceService_shouldSendCorrectRequest {
    NSString *url = [NSString stringWithFormat:@"%@/avf/api/%@", kURLBase, @"venue.php"];
    [parameters setObject:@(true) forKey:@"info"];
    [parameters setObject:@"venue_test" forKey:@"venue"];
    
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    OCMExpect([sessionManager GET:[OCMArg checkWithBlock:^BOOL(NSString *searchUrl) {
        return [searchUrl isEqualToString:url];
    }] parameters:[OCMArg checkWithBlock:^BOOL(NSDictionary *param) {
        return [param isEqualToDictionary:parameters];
    }] progress:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]]);
    
    [WSAviewFromMySeat getWithParameters:parameters completion:nil failure:nil];
    
    OCMVerifyAll(sessionManager);
}

- (void)testDetailPlaceService_shouldInvokeSuccessCallback_whenRequestSuccess {
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    OCMStub([sessionManager GET:[OCMArg any] parameters:[OCMArg any]
                       progress:[OCMArg any]
                        success:([OCMArg invokeBlockWithArgs:[OCMArg any], [self mockedResponseDictionaryDetailPlace], nil])
                        failure:[OCMArg any]]);
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Successfully callback"];
    
    [WSAviewFromMySeat getWithParameters:nil completion:^(id<Model> model) {
        [expecation fulfill];
        assertThat(model, isA([DetailPlace class]));

    } failure:nil];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testDetailPlaceService_shouldInvokeFailureCallback_whenRequestFailed {
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    NSError *mockError = [NSError errorWithDomain:@"MockError" code:400 userInfo:nil];
    OCMStub([sessionManager GET:[OCMArg any] parameters:[OCMArg any]
                       progress:[OCMArg any]
                        success:[OCMArg any]
                        failure:([OCMArg invokeBlockWithArgs:[OCMArg any], mockError, nil])]);
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Successfully callback"];
    
    [WSAviewFromMySeat getWithParameters:nil completion:nil failure:^(NSError *error) {
        [expecation fulfill];
        assertThat(error, allOfIn(@[hasProperty(@"code", @(mockError.code)),
                                    hasProperty(@"domain", mockError.domain)]));
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}


- (NSDictionary *)mockedResponseDictionaryPlace {
    return  @{@"avfms":@[@{@"note": @"",
                           @"views": @"597",
                           @"row": @"7",
                           @"seat": @"10",
                           @"section": @"219",
                           @"venue": @"Globe Life Park in Arlington",
                           @"image": @"image.jpg"}]};
}

- (NSDictionary *)mockedResponseDictionaryDetailPlace {
    return  @{@"avfms":@[@{@"address": @"USTA Billie Jean King National Tennis Center",
                           @"average_rating": @"4.3",
                           @"city": @"New York",
                           @"country": @"United States",
                           @"name": @"Arthur Ashe Stadium",
                           @"newest_image": @"image.jpg",
                           @"state": @"New York",
                           @"sameas": @"",
                           @"stats": @""}]};
}

@end
