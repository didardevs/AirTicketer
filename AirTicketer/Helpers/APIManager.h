//
//  APIManager.h
//  AirTicketer
//
//  Created by Didar Naurzbayev on 4/9/19.
//  Copyright © 2019 Didar Naurzbayev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"

#define AirlineLogo(iata) [NSURL URLWithString:[NSString stringWithFormat:@"https://pics.avs.io/200/200/%@.png", iata]];
#define API_URL_MAP_PRICE @"https://map.aviasales.ru/prices.json?origin_iata="

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void)ticketsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSArray *tickets))completion;
- (void)cityForCurrentIP:(void (^)(City *city))completion;
- (void)mapPricesFor:(City *)origin withCompletion:(void (^)(NSArray *prices))completion;

@end


NS_ASSUME_NONNULL_END
