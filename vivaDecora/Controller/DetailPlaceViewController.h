//
//  DetailPlaceViewController.h
//  vivaDecora
//
//  Created by PH on 26/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailPlace.h"
#import "View.h"
#import "DetailPlacePresenter.h"

@interface DetailPlaceViewController : UIViewController <View>

@property (nonatomic, copy) NSString *venue;

@property id<Repository>repository;
@property DetailPlacePresenter *presenter;

@end
