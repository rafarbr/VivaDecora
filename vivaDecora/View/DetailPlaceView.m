//
//  DetailPlaceView.m
//  vivaDecora
//
//  Created by PH on 26/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "DetailPlaceView.h"
#import "DetailPlace.h"
#import "UIImageView+AFNetworking.h"
#import "DetailPlaceViewController.h"

@implementation DetailPlaceView

- (void)configureViewWithModel:(id<Model>)model {
    DetailPlace *m = model;
    self.venueLabel.text = [m name];
    self.addressLabel.text = [NSString stringWithFormat:@"%@, %@", [m address], [m state]];
    self.locationLabel.text = [NSString stringWithFormat:@"%@, %@", [m city], [m country]];
    self.ratingLabel.text = [m rating];
    [self updateImage:[m img]];
    [self updateStats:[m stats]];
    [self updateSameas:[m sameas]];
    self.contentScrollView.alpha = 1;
}

#pragma mark - Private Methods
- (void)updateImage:(NSURL*)url {
    [self.spining startAnimating];
    [self.detailImageView setImageWithURLRequest:[NSURLRequest requestWithURL:url] placeholderImage:[UIImage imageNamed:@"noImage"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        
        self.detailImageView.image = image;
        [self.spining stopAnimating];
        
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        [self.spining stopAnimating];
    }];
}

- (void)updateStats:(NSString*)stats {
    if (stats) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                       initWithData: [stats dataUsingEncoding:NSUnicodeStringEncoding]
                                                       options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                       documentAttributes: nil
                                                       error: nil
                                                       ];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, attributedString.length)];
        self.statsTextView.attributedText = attributedString;
    } else {
        [self.statsStackView removeFromSuperview];
    }
}

- (void)updateSameas:(NSString*)sameas {
    if (sameas) {
        NSArray *listsameas = [[sameas stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"] componentsSeparatedByString: @","];
        self.siteURL = [NSURL URLWithString:[listsameas firstObject]];
    } else {
        [self.linkStackView removeFromSuperview];
    }

}

#pragma mark - actions
- (IBAction)siteTouchButton:(id)sender {
    [[UIApplication sharedApplication] openURL:self.siteURL];
}

@end
