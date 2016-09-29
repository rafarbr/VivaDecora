//
//  DetailPlaceView.h
//  vivaDecora
//
//  Created by PH on 26/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface DetailPlaceView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *venueLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStackView *statsStackView;
@property (weak, nonatomic) IBOutlet UITextView *statsTextView;
@property (weak, nonatomic) IBOutlet UIStackView *linkStackView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spining;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (strong, nonatomic) NSURL *siteURL;

- (void)configureViewWithModel:(id<Model>)model;

@end
