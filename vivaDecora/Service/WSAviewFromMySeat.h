//
//  WSAviewFromMySeat.h
//  vivaDecora
//
//  Created by PH on 24/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "Constants.h"

@interface WSAviewFromMySeat : NSObject

+ (void)listWithCompletion:(void (^)(NSArray<Model> *))completion failure:(void (^)(NSError *error))failure;

+ (void)getWithParameters:(NSDictionary *)parameters completion:(void (^)(id<Model>))completion failure:(void (^)(NSError *error))failure;

@end
