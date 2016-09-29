//
//  UIAlertController+Custom.h
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VDAlertAction) {
    VDAlertActionSucess = 0,
    VDAlertActionFail
};


@interface UIAlertController (Custom)

- (UIAlertController *)initWithTitle:(NSString*)title message:(NSString*)message completion:(void (^)(VDAlertAction alertAction))completion;

@end
