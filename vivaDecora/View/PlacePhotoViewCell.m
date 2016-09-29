//
//  PlacePhotoViewCell.m
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "PlacePhotoViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "WSAviewFromMySeat.h"

@implementation PlacePhotoViewCell

- (void)configureCellWithModel:(id<Model>)model {
    Place *m = model;
    self.venueLabel.text = [m venue];
    self.noteLabel.text = [m note];
    self.locationLabel.text = [NSString stringWithFormat:@"Section %@, Row %@, Seat %@", [m section], [m row], [m seat]];
    self.viewsLabel.text = [m views];
    [self.spining startAnimating];
    [self.placeImageView setImageWithURLRequest:[NSURLRequest requestWithURL:m.img] placeholderImage:[UIImage imageNamed:@"noImage"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.placeImageView.image = image;
        [self.spining stopAnimating];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        [self.spining stopAnimating];
    }];
}

@end
