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
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(sleepNotification:)
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(wakeUpNotification:)
                                                    name:UIApplicationWillEnterForegroundNotification
                                                  object:nil];
    }
    return self;
}

- (void)sleepNotification:(NSNotification *)notification {
    
    NSLog(@"%@ going sleep",[self class]);
}

- (void)wakeUpNotification:(NSNotification *)notification {
    
    NSLog(@"%@ wake up",[self class]);
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
    
    _inflation = (ap - _averagePrice)/_averagePrice;
    
    if (_inflation > 0) {
        NSLog(@"Pensioner %@ dissatisfied",self.name);
    } else if (_inflation == 0) {
        NSLog(@"Pensioner %@ not concerned",self.name);
    } else if (_inflation < 0) {
        NSLog(@"Pensioner %@ is happy",self.name);
    }
    
    _averagePrice = ap;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
