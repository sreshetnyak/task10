//
//  TTGovernment.m
//  Notification
//
//  Created by sergey on 2/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTGovernment.h"

NSString * const TTGovernmentPensionLevelDidChangeNotification = @"TTGovernmentPensionLevelDidChangeNotification";
NSString * const TTGovernmentTaxesLevelDidChangeNotification = @"TTGovernmentTaxesLevelDidChangeNotification";
NSString * const TTGovernmentSalaryLevelDidChangeNotification = @"TTGovernmentSalaryLevelDidChangeNotification";
NSString * const TTGovernmentAveragePriceDidChangeNotification = @"TTGovernmentAveragePriceDidChangeNotification";
NSString * const TTGovernmentInitNotification = @"TTGovernmentInitNotification";

NSString * const TTGovernmentPensionLevelUserInfo = @"TTGovernmentPensionLevelUserInfo";
NSString * const TTGovernmentTaxesLevelUserInfo = @"TTGovernmentTaxesLevelUserInfo";
NSString * const TTGovernmentSalaryLevelUserInfo = @"TTGovernmentSalaryLevelUserInfo";
NSString * const TTGovernmentAveragePriceUserInfo = @"TTGovernmentAveragePriceUserInfo";
NSString * const TTGovernmentInitNotificationUserInfo = @"TTGovernmentInitNotificationUserInfo";

@implementation TTGovernment

- (id)initGovernmentWithPensionLevel:(CGFloat)pensionLevel
                          taxesLevel:(CGFloat)taxesLevel
                         salaryLevel:(CGFloat)salaryLevel
                        averagePrice:(CGFloat)averagePrice {

    if (self = [super init]) {
        _pensionLevel = pensionLevel;
        _taxesLevel = taxesLevel;
        _salaryLevel = salaryLevel;
        _averagePrice = averagePrice;
    }
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithFloat:pensionLevel],TTGovernmentPensionLevelUserInfo,
                                [NSNumber numberWithFloat:taxesLevel],TTGovernmentTaxesLevelUserInfo,
                                [NSNumber numberWithFloat:salaryLevel],TTGovernmentSalaryLevelUserInfo,
                                [NSNumber numberWithFloat:averagePrice],TTGovernmentAveragePriceUserInfo, nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentInitNotification
                                                       object:nil
                                                     userInfo:dictionary];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(sleepNotification:)
                                                name:UIApplicationDidEnterBackgroundNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(wakeUpNotification:)
                                                name:UIApplicationWillEnterForegroundNotification
                                              object:nil];
    
    return self;
}

- (void)sleepNotification:(NSNotification *)notification {
    
    NSLog(@"%@ going sleep",[self class]);
}

- (void)wakeUpNotification:(NSNotification *)notification {
    
    NSLog(@"%@ wake up",[self class]);
}

- (void)setPensionLevel:(CGFloat)pensionLevel {
    _pensionLevel = pensionLevel;
                     
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pensionLevel]
                                                           forKey:TTGovernmentPensionLevelUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentPensionLevelDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

- (void)setSalaryLevel:(CGFloat)salaryLevel {
    _salaryLevel = salaryLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salaryLevel]
                                                           forKey:TTGovernmentSalaryLevelUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentSalaryLevelDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

- (void)setTaxesLevel:(CGFloat)taxesLevel {
    _taxesLevel = taxesLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxesLevel]
                                                           forKey:TTGovernmentTaxesLevelUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentTaxesLevelDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

- (void)setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice]
                                                           forKey:TTGovernmentAveragePriceUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentAveragePriceDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

@end
