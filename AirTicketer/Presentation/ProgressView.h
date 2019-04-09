//
//  ProgressView.h
//  AirTicketer
//
//  Created by Didar Naurzbayev on 4/9/19.
//  Copyright © 2019 Didar Naurzbayev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressView : UIView

+ (instancetype)sharedInstance;

- (void)show:(void (^)(void))completion;
- (void)dismiss:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
