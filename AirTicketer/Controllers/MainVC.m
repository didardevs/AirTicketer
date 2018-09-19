//
//  ViewController.m
//  AirTicketer
//
//  Created by Didar Naurzbayev on 9/19/18.
//  Copyright © 2018 Didar Naurzbayev. All rights reserved.
//

#import "MainVC.h"
#import "DataManager.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[DataManager shared] loadData];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataDidLoad:) name:@"ModelUpdatedNotification" object:nil];
}

-(void)dataDidLoad:(NSNotification *) notification
{
    self.view.backgroundColor = UIColor.yellowColor;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
