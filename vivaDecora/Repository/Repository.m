//
//  Repository.m
//  vivaDecora
//
//  Created by PH on 28/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "Repository.h"
#import "WSAviewFromMySeat.h"

@implementation Repository

- (void)listWithCompletion:(void (^)(NSArray<Model> *array))completion failure:(void (^)(NSError *))failure {
    [WSAviewFromMySeat listWithCompletion:completion failure:failure];
}

- (void)getWithParameters:(NSDictionary *)parameters completion:(void (^)(id<Model> model))completion failure:(void (^)(NSError *))failure
{
    [WSAviewFromMySeat getWithParameters:parameters completion:completion failure:failure];
}

@end
