//
//  TTPensioner.m
//  Notification
//
//  Created by sergey on 2/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTPensioner.h"
#import "TTGovernment.h"

@implementation TTPensioner

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(pensionLevelNotification:)
                                                    name:TTGovernmentPensionLevelDidChangeNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(averagePriceNotification:)
                                                    name:TTGovernmentAveragePriceDidChangeNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(initNotification:)
                                                    name:TTGovernmentInitNotification
                                                  object:nil];
    }
    return self;
}

- (void)initNotification:(NSNotification *)notification {
    CGFloat pl = [[notification.userInfo valueForKey:TTGovernmentPensionLevelUserInfo]floatValue];
    
    _pensionLevel = pl;
    
    CGFloat ap = [[notification.userInfo valueForKey:TTGovernmentAveragePriceUserInfo]floatValue];
    
    _averagePrice = ap;
}

- (void)pensionLevelNotification:(NSNotification *)notification {
    NSLog(@"pensionLevelNotification for %@",self.name);
    
    CGFloat pl = [[notification.userInfo valueForKey:TTGovernmentPensionLevelUserInfo]floatValue];
    
    _pensionLevel = pl;
}

- (void)averagePriceNotification:(NSNotification *)notification {
    NSLog(@"averagePriceNotification for %@",self.name);
    
    CGFloat ap = [[notification.userInfo valueForKey:TTGovernmentAveragePriceUserInfo]floatValue];
    
    _averagePrice = ap;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
