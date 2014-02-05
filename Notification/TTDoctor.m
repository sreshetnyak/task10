//
//  TTDoctor.m
//  Notification
//
//  Created by sergey on 2/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTDoctor.h"
#import "TTGovernment.h"

@implementation TTDoctor

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(salaryLevelNotification:)
                                                    name:TTGovernmentSalaryLevelDidChangeNotification
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
    CGFloat sl = [[notification.userInfo valueForKey:TTGovernmentSalaryLevelUserInfo]floatValue];
    
    _salaryLevel = sl;
    
    CGFloat ap = [[notification.userInfo valueForKey:TTGovernmentAveragePriceUserInfo]floatValue];
    
    _averagePrice = ap;
}

- (void)salaryLevelNotification:(NSNotification *)notification {
    NSLog(@"salaryLevelNotification for %@",self.name);
    CGFloat sl = [[notification.userInfo valueForKey:TTGovernmentSalaryLevelUserInfo]floatValue];
    
    _salaryLevel = sl;
}

- (void)averagePriceNotification:(NSNotification *)notification {
    NSLog(@"averagePriceNotification for %@",self.name);
    CGFloat ap = [[notification.userInfo valueForKey:TTGovernmentAveragePriceUserInfo]floatValue];
    _inflation = (ap - _averagePrice)/_averagePrice;
    
    if (_inflation > 0) {
        NSLog(@"Doctor %@ dissatisfied",self.name);
    } else if (_inflation == 0) {
        NSLog(@"Doctor %@ not concerned",self.name);
    } else if (_inflation < 0) {
        NSLog(@"Doctor %@ is happy",self.name);
    }
    
    _averagePrice = ap;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
