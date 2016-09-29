//
//  PlaceDetail.m
//  vivaDecora
//
//  Created by PH on 26/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "DetailPlace.h"

@implementation DetailPlace

- (instancetype)initWithName:(NSString *)name address:(NSString *)address city:(NSString *)city country:(NSString *)country state:(NSString *)state urlImage:(NSURL *)url rating:(NSString *)rating stats:(NSString *)stats semeas:(NSString *)sameas {
    if (self = [super init]) {
        _name = name;
        _address = address;
        _city = city;
        _country = country;
        _state = state;
        _img = url;
        _rating = rating;
        _stats = [stats isEqualToString:@""] ? nil : stats;
        _sameas = [sameas isEqualToString:@""] ? nil : sameas;
    }
    return self;
}

- (id)identification {
    return  _name;
}

@end
