//
//  DataManager.m
//  AirTicketer
//
//  Created by Didar Naurzbayev on 9/19/18.
//  Copyright © 2018 Didar Naurzbayev. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()

@property (nonatomic, strong, readwrite) NSArray *countries;
@property (nonatomic, strong, readwrite) NSArray *cities;
@property (nonatomic, strong, readwrite) NSArray *airports;

@end


@implementation DataManager

//singleton init
+(instancetype)shared
{
    static DataManager *instance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[DataManager alloc] init];
    });
    
    return instance;
}

- (void)loadData
{
    __weak DataManager *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSArray *countriesJSONArray = [self arrayFromFileName:@"countries" ofType:@"json"];
        weakSelf.countries = [self createObjectsFromArray:countriesJSONArray withType:country];
        
        NSArray *citiesJSONArray = [self arrayFromFileName:@"cities" ofType:@"json"];
        weakSelf.cities = [self createObjectsFromArray:citiesJSONArray withType:city];
        
        NSArray *airportsJSONArray = [self arrayFromFileName:@"airports" ofType:@"json"];
        weakSelf.airports = [self createObjectsFromArray:airportsJSONArray withType:city];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ModelUpdatedNotification" object:nil];
        });
    });
}

- (NSMutableArray *)createObjectsFromArray:(NSArray *)array withType:(DataSourceType)type
{
    NSMutableArray *results = [NSMutableArray new];
    
    for (NSDictionary *jsonObject in array) {
        switch (type) {
            case country:
            {
                Country *country = [[Country alloc] initWithDictionary: jsonObject];
                [results addObject: country];
                break;
            }
            case city:
            {
                City *city = [[City alloc] initWithDictionary: jsonObject];
                [results addObject: city];
                break;
            }
            case airport:
            {
                Airport *airport = [[Airport alloc] initWithDictionary: jsonObject];
                [results addObject: airport];
                break;
            }
            default:
                break;
        }
    }
    
    return results;
}

- (NSArray *)arrayFromFileName:(NSString *)fileName ofType:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

@end
