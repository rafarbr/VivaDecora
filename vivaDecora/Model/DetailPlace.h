//
//  PlaceDetail.h
//  vivaDecora
//
//  Created by PH on 26/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface DetailPlace : NSObject <Model>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *address;
@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) NSString *state;
@property (nonatomic, copy, readonly) NSURL *img;
@property (nonatomic, copy, readonly) NSString *rating;
@property (nonatomic, copy, readonly) NSString *stats;
@property (nonatomic, copy, readonly) NSString *sameas;

- (instancetype)initWithName:(NSString *)name address:(NSString *)address city:(NSString *)city country:(NSString *)country state:(NSString *)state urlImage:(NSURL *)url rating:(NSString *)rating stats:(NSString *)stats semeas:(NSString *)sameas;
@end
