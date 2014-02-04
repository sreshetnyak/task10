//
//  TTGovernment.h
//  Notification
//
//  Created by sergey on 2/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const TTGovernmentPensionLevelDidChangeNotification;
extern NSString * const TTGovernmentTaxesLevelDidChangeNotification;
extern NSString * const TTGovernmentSalaryLevelDidChangeNotification;
extern NSString * const TTGovernmentAveragePriceDidChangeNotification;
extern NSString * const TTGovernmentInitNotification;

extern NSString * const TTGovernmentPensionLevelUserInfo;
extern NSString * const TTGovernmentTaxesLevelUserInfo;
extern NSString * const TTGovernmentSalaryLevelUserInfo;
extern NSString * const TTGovernmentAveragePriceUserInfo;
extern NSString * const TTGovernmentInitNotificationUserInfo;

@interface TTGovernment : NSObject

@property (assign,nonatomic) CGFloat pensionLevel;
@property (assign,nonatomic) CGFloat taxesLevel;
@property (assign,nonatomic) CGFloat salaryLevel;
@property (assign,nonatomic) CGFloat averagePrice;

- (id)initGovernmentWithPensionLevel:(CGFloat)pensionLevel
                          taxesLevel:(CGFloat)taxesLevel
                         salaryLevel:(CGFloat)salaryLevel
                        averagePrice:(CGFloat)averagePrice;

@end
