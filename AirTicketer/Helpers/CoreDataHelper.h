//
//  CoreDataHelper.h
//  AirTicketer
//
//  Created by Didar Naurzbayev on 4/9/19.
//  Copyright © 2019 Didar Naurzbayev. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DataManager.h"
#import "FavoriteTicket+CoreDataClass.h"
#import "Ticket.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataHelper : NSObject

+ (instancetype)sharedInstance;

- (BOOL)isFavorite:(Ticket *)ticket;
- (NSArray *)favorites;
- (void)addToFavorite:(Ticket *)ticket;
- (void)removeFromFavorite:(Ticket *)ticket;

@end

NS_ASSUME_NONNULL_END
