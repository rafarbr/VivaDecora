//
//  UIAlertController+Custom.m
//  vivaDecora
//
//  Created by PH on 23/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "UIAlertController+Custom.h"

@implementation UIAlertController (Custom)

- (UIAlertController *)initWithTitle:(NSString*)title message:(NSString*)message completion:(void (^)(VDAlertAction))completion {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion(VDAlertActionSucess);
        }
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion(VDAlertActionFail);
        }
    }]];
    return alertController;
}

@end
