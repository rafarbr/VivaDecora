//
//  DetailPlacePresenter.m
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "DetailPlacePresenter.h"

@implementation DetailPlacePresenter

@synthesize view;
@synthesize repository;
@synthesize venue;
@synthesize detailPlace;

- (void)initWithView:(id<View>)theView andRepository:(id<Repository>)repo andVenue:(NSString *)idItem {
    venue = idItem;
    [self initWithView:theView andRepository:repo];
}

- (void)initWithView:(id<View>)theView andRepository:(id<Repository>)repo {
    self.view = theView;
    self.repository = repo;
    [self requestAndUpdateView];
}

- (void)requestAndUpdateView {
    [repository getWithParameters:@{@"venue": venue} completion:^(id<Model> model) {
        detailPlace = model;
        if ([view respondsToSelector:@selector(onReceived:)]) {
            [view onReceived:model];
        }
    } failure:^(NSError *error) {
        if ([view respondsToSelector:@selector(onErrorReceived:)]) {
            [view onErrorReceived:error];
        }
    }];
}

@end
