//
//  ViewController.h
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"
#import "PlacePresenter.h"
#import "PlaceTableViewDataSource.h"

@interface PlaceViewController : UIViewController <View>

@property id<Repository>repository;
@property PlacePresenter *presenter;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PlaceTableViewDataSource* tableViewDataSource;

@end


@interface PlaceViewController(TableViewDelegate) <UITableViewDelegate>


@end

