//
//  TicketsViewController.h
//  AirTicketer
//
//  Created by Didar Naurzbayev on 4/9/19.
//  Copyright © 2019 Didar Naurzbayev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketsViewController : UITableViewController

- (instancetype)initFavoriteTicketsController;
- (instancetype)initWithTickets:(NSArray *)tickets;

@end

NS_ASSUME_NONNULL_END
