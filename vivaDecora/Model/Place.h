//
//  Place.h
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface Place : NSObject <Model>

@property (nonatomic, copy, readonly) NSString *venue;
@property (nonatomic, copy, readonly) NSString *note;
@property (nonatomic, copy, readonly) NSString *section;
@property (nonatomic, copy, readonly) NSString *row;
@property (nonatomic, copy, readonly) NSString *seat;
@property (nonatomic, copy, readonly) NSURL *img;
@property (nonatomic, copy, readonly) NSString *views;

- (instancetype)initWithVenue:(NSString *)venue section:(NSString *)section row:(NSString *)row seat:(NSString *)seat note:(NSString *)note urlImage:(NSURL *)url views:(NSString *)views;

@end
