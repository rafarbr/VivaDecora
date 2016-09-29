//
//  View.h
//  vivaDecora
//
//  Created by PH on 29/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@protocol View <NSObject>

@optional
- (void)onReceived:(id<Model>)model;
- (void)onErrorReceived:(NSError*)error;

@end
