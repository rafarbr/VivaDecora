//
//  WSAviewFromMySeat.m
//  vivaDecora
//
//  Created by PH on 24/09/16.
//  Copyright © 2016 i9app. All rights reserved.
//

#import "WSAviewFromMySeat.h"
#import "Place.h"
#import "DetailPlace.h"
#import <AFNetworking/AFNetworking.h>

@implementation WSAviewFromMySeat

+ (void)listWithCompletion:(void (^)(NSArray<Model> *array))completion failure:(void (^)(NSError *error))failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *url = [NSString stringWithFormat:@"%@/avf/api/%@", kURLBase, @"featured.php"];
    NSString *appkey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"APIToken"];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:appkey forKey:@"appkey"];
    
    [[AFHTTPSessionManager manager] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = (NSDictionary *)responseObject;
        NSArray *array = result[@"avfms"];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (completion) {
            
            NSMutableArray<Model> *ret = [[NSMutableArray<Model> alloc] init];
            Place *place = nil;
            
            for (NSDictionary *dic in array) {
                place = [[Place alloc] initWithVenue:dic[@"venue"] section:dic[@"section"] row:dic[@"row"] seat:dic[@"seat"] note:dic[@"note"] urlImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@/wallpaper/%@", kURLBase, dic[@"image"]]] views:dic[@"views"]];
                [ret addObject:place];
            }
            
            completion(ret);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
    }];

}

+ (void)getWithParameters:(NSDictionary *)parameters completion:(void (^)(id<Model> model))completion failure:(void (^)(NSError *error))failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *url = [NSString stringWithFormat:@"%@/avf/api/%@", kURLBase, @"venue.php"];
    NSString *appkey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"APIToken"];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:appkey forKey:@"appkey"];
    [param setObject:@(true) forKey:@"info"];
    [param addEntriesFromDictionary:parameters];

    [[AFHTTPSessionManager manager] GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = (NSDictionary *)responseObject;
        NSDictionary *dic = [((NSArray*)result[@"avfms"]) firstObject];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (completion) {
            DetailPlace *detailPlace = [[DetailPlace alloc] initWithName:dic[@"name"] address:dic[@"address"] city:dic[@"city"] country:dic[@"country"] state:dic[@"state"] urlImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@/wallpaper/%@", kURLBase, dic[@"newest_image"]]] rating:dic[@"average_rating"] stats:dic[@"stats"] semeas:dic[@"sameas"]];
            completion(detailPlace);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
    }];
}

@end
