//
//  Presenter.h
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Repository.h"
#import "View.h"

@protocol Repository;

@protocol Presenter <NSObject>

@optional
- (void)requestAndUpdateView;

@property(nonatomic,strong) id<View> view;
@property(nonatomic,strong) id<Repository> repository;

- (void)initWithView:(id<View>)theView andRepository:(id<Repository>)repo;
@end
