//
//  NSString+Localize.m
//  AirTicketer
//
//  Created by Didar Naurzbayev on 4/9/19.
//  Copyright © 2019 Didar Naurzbayev. All rights reserved.
//

#import "NSString+Localize.h"

@implementation NSString (Localize)

- (NSString *)localize {
    return NSLocalizedString(self, nil);
}

@end
