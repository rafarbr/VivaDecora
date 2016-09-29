//
//  PlacePresenter.m
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "PlacePresenter.h"

@implementation PlacePresenter

@synthesize view;
@synthesize repository;

- (void)initWithView:(id<View>)theView andRepository:(id<Repository>)repo {
    self.view = theView;
    self.repository = repo;
    
    [self requestAndUpdateView];
}

- (void)requestAndUpdateView {
    [repository listWithCompletion:^(NSArray<Model> *listModel) {
        if ([view respondsToSelector:@selector(onReceived:)]) {
            [view onReceived:listModel];
        }
    } failure:^(NSError *error) {
        if ([view respondsToSelector:@selector(onErrorReceived:)]) {
            [view onErrorReceived:error];
        }
    }];
}

@end
