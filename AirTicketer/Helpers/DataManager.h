//
//  DataManager.h
//  AirTicketer
//
//  Created by Didar Naurzbayev on 9/19/18.
//  Copyright © 2018 Didar Naurzbayev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "City.h"
#import "Airport.h"

typedef enum DataSourceType {
    country,
    city,
    airport
} DataSourceType;

@interface DataManager : NSObject

+ (instancetype)shared; //singleton

-(void)loadData;

@property (nonatomic, strong, readonly) NSArray *countries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

@end


