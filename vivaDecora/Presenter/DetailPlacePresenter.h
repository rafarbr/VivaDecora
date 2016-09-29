//
//  DetailPlacePresenter.h
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Presenter.h"
#import "Repository.h"
#import "DetailPlace.h"
#import "View.h"

@interface DetailPlacePresenter : NSObject <Presenter>

@property (nonatomic, copy, readonly) NSString *venue;
@property (nonatomic, copy, readonly) DetailPlace *detailPlace;

- (void)initWithView:(id<View>)theView andRepository:(id<Repository>)repo andVenue:(NSString*)venue;

@end
