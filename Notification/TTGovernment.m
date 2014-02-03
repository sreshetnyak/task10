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

NSString * const TTGovernmentPensionLevelUserInfo = @"TTGovernmentPensionLevelUserInfo";
NSString * const TTGovernmentTaxesLevelUserInfo = @"TTGovernmentTaxesLevelUserInfo";
NSString * const TTGovernmentSalaryLevelUserInfo = @"TTGovernmentSalaryLevelUserInfo";
NSString * const TTGovernmentAveragePriceUserInfo = @"TTGovernmentAveragePriceUserInfo";

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
    return self;
}

- (void)setPensionLevel:(CGFloat)pensionLevel {
    _pensionLevel = pensionLevel;
                     
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pensionLevel]
                                                           forKey:TTGovernmentPensionLevelUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentPensionLevelDidChangeNotification
                                                       object:dictionary];
}

- (void)setSalaryLevel:(CGFloat)salaryLevel {
    _salaryLevel = salaryLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salaryLevel]
                                                           forKey:TTGovernmentSalaryLevelUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentSalaryLevelDidChangeNotification
                                                       object:dictionary];
}

- (void)setTaxesLevel:(CGFloat)taxesLevel {
    _taxesLevel = taxesLevel;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxesLevel]
                                                           forKey:TTGovernmentTaxesLevelUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentTaxesLevelDidChangeNotification
                                                       object:dictionary];
}

- (void)setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice]
                                                           forKey:TTGovernmentAveragePriceUserInfo];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TTGovernmentAveragePriceDidChangeNotification
                                                       object:dictionary];
}

@end
