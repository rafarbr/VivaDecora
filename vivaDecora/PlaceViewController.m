//
//  ViewController.m
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "PlaceViewController.h"
#import "Place.h"
#import "PlacePhotoViewCell.h"
#import "WSAviewFromMySeat.h"
#import "DetailPlaceViewController.h"
#import "UIAlertController+Custom.h"

@interface PlaceViewController ()

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation PlaceViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Viva Decora";
    
    _presenter = [[PlacePresenter alloc] init];
    _repository = [[Repository alloc] init];
    [_presenter initWithView:self andRepository:_repository];

    [self.tableView setDelegate:self];
    [self refreshTable:self];
}

- (void)onReceived:(id<Model>)model {
    if (self.refreshControl) {
        [self.refreshControl endRefreshing];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
    }
    _tableViewDataSource = [[PlaceTableViewDataSource alloc] initWithPlace:(NSArray<Model>*)model];
    self.tableView.dataSource = _tableViewDataSource;
    [self.tableView reloadData];
}

- (void)onErrorReceived:(NSError *)error {
    UIAlertController * alertController = [[UIAlertController alloc] initWithTitle:@"Retry?" message:error.localizedDescription completion:^(VDAlertAction alertAction) {
        [_presenter requestAndUpdateView];
    }];
    [self presentViewController:alertController animated:true completion:nil];
   
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(PlacePhotoViewCell*)sender {
    [super prepareForSegue:segue sender:sender];
    DetailPlaceViewController *detailPlaceViewController = segue.destinationViewController;
    detailPlaceViewController.venue = sender.venueLabel.text;
}

#pragma mark - Data Fetchers
- (void)refreshTable:(id)sender {
    [_presenter requestAndUpdateView];
}

#pragma mark - setter and getter
- (UIRefreshControl *)refreshControl {
    if (!_refreshControl) {
        _refreshControl = [[UIRefreshControl alloc] init];
        _refreshControl.tintColor = [UIColor whiteColor];
        [_refreshControl addTarget:self action:@selector(refreshTable:) forControlEvents:UIControlEventValueChanged];
        [self.tableView setRefreshControl:_refreshControl];
    }
    return _refreshControl;
}

@end

@implementation PlaceViewController (TableViewDelegate)

#pragma Mark - TableView delegate methods

@end
