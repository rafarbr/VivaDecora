//
//  PlaceTableViewDataSource.m
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "PlaceTableViewDataSource.h"
#import "Place.h"
#import "PlacePhotoViewCell.h"

@implementation PlaceTableViewDataSource

- (id)initWithPlace:(NSArray*)place {
    self = [super init];
    if (self)
    {
        _place = place;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_place count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* CellID = @"PlaceCell";
    
    PlacePhotoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    [cell configureCellWithModel:self.place[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Clicked");
}


@end
