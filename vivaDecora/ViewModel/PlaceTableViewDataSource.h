//
//  PlaceTableViewDataSource.h
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PlaceTableViewDataSource : NSObject <UITableViewDataSource>

@property(nonatomic, copy, readonly) NSArray* place;

- (id)initWithPlace:(NSArray*)place;


@end
