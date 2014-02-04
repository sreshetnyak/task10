//
//  TTBusinessman.m
//  Notification
//
//  Created by sergey on 2/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTBusinessman.h"
#import "TTGovernment.h"

@implementation TTBusinessman

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(taxesLevelNotification:)
                                                    name:TTGovernmentTaxesLevelDidChangeNotification
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
    CGFloat tl = [[notification.userInfo valueForKey:TTGovernmentTaxesLevelUserInfo] floatValue];
    
    _taxesLevel = tl;
    
    CGFloat ap = [[notification.userInfo valueForKey:TTGovernmentAveragePriceUserInfo]floatValue];
    
    _averagePrice = ap;
}

- (void)taxesLevelNotification:(NSNotification *)notification {
    NSLog(@"taxesLevelNotification for %@",self.name);
    CGFloat tl = [[notification.userInfo valueForKey:TTGovernmentTaxesLevelUserInfo] floatValue];
    
    _taxesLevel = tl;
}

- (void)averagePriceNotification:(NSNotification *)notification {
    NSLog(@"averagePriceNotification for %@",self.name);
    CGFloat ap = [[notification.userInfo objectForKey:TTGovernmentAveragePriceUserInfo] floatValue];
    
    _averagePrice = ap;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
