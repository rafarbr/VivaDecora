//
//  Place.m
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "Place.h"

@implementation Place

- (instancetype)initWithVenue:(NSString *)venue section:(NSString *)section row:(NSString *)row seat:(NSString *)seat note:(NSString *)note urlImage:(NSURL *)url views:(NSString *)views {
    if (self = [super init]) {
        _venue = venue;
        _section = section;
        _row = row;
        _seat = seat;
        _note = note;
        _img = url;
        _views = views;
    }

    return self;
}

- (id)identification {
    return _venue;
}

@end
