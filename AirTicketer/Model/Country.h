//
//  Country.h
//  AirTicketer
//
//  Created by Didar Naurzbayev on 9/19/18.
//  Copyright © 2018 Didar Naurzbayev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSDictionary *translations;
@property (nonatomic, strong) NSString *code;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


