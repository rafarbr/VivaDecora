//
//  PlacePhotoViewCell.h
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
#import "Model.h"


@interface PlacePhotoViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *venueLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spining;

- (void)configureCellWithModel:(id<Model>)model;

@end
