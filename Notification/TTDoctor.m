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
    }
    return self;
}

- (void)salaryLevelNotification:(NSNotification *)notification {
    
    NSLog(@"salaryLevelNotification");
    
}

- (void)averagePriceNotification:(NSNotification *)notification {
    NSLog(@"averagePriceNotification");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
