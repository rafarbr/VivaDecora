//
//  DetailPlaceViewController.m
//  vivaDecora
//
//  Created by PH on 26/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "DetailPlaceViewController.h"
#import "WSAviewFromMySeat.h"
#import "DetailPlaceView.h"
#import "UIAlertController+Custom.h"

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end

@interface DetailPlaceViewController ()

@property (strong, nonatomic) IBOutlet DetailPlaceView *detailPlaceView;

@end

@implementation DetailPlaceViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)];
    
    _presenter = [[DetailPlacePresenter alloc] init];
    _repository = [[Repository alloc] init];
    [_presenter initWithView:self andRepository:_repository andVenue:_venue];
}

- (void)onReceived:(id<Model>)model {
    [_detailPlaceView configureViewWithModel:model];
}

- (void)onErrorReceived:(NSError *)error {
    UIAlertController * alertController = [[UIAlertController alloc] initWithTitle:@"Retry?" message:error.localizedDescription completion:^(VDAlertAction alertAction) {
        switch (alertAction) {
            case VDAlertActionSucess:
                [_presenter requestAndUpdateView];
                break;
            default:
                [self.navigationController popViewControllerAnimated:YES];
                break;
        }
    }];
    [self presentViewController:alertController animated:true completion:nil];

}

#pragma mark - actions
- (void)share:(id)sender {
    NSString * text = [NSString stringWithFormat:@"This is the seat of the %@.", _presenter.detailPlace.name];
    UIActivityViewController * activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[text, self.detailPlaceView.detailImageView.image] applicationActivities:nil];
    activityViewController.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    [self presentViewController:activityViewController animated:true completion:nil];
}


@end
