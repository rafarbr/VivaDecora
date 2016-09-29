//
//  Repository.h
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@protocol Repository<NSObject>

@required
- (void)listWithCompletion:(void (^)(NSArray<Model> *listModel))completion failure:(void (^)(NSError *error))failure;
- (void)getWithParameters:(NSDictionary*)parameters completion:(void (^)(id<Model> model))completion failure:(void (^)(NSError *error))failure;
@end

@interface Repository : NSObject <Repository>

@end
