//
//  Ticket.m
//  AirTicketer
//
//  Created by Didar Naurzbayev on 4/9/19.
//  Copyright © 2019 Didar Naurzbayev. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _airline = [dictionary valueForKey:@"airline"];
        _expires = dateFromString([dictionary valueForKey:@"expires_at"]);
        _departure = dateFromString([dictionary valueForKey:@"departure_at"]);
        _flightNumber = [dictionary valueForKey:@"flight_number"];
        _price = [dictionary valueForKey:@"price"];
        _returnDate = dateFromString([dictionary valueForKey:@"return_at"]);
    }
    return self;
}

NSDate *dateFromString(NSString *dateString) {
    if (!dateString) { return  nil; }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *correctSrtingDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctSrtingDate = [correctSrtingDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter dateFromString: correctSrtingDate];
}

@end
