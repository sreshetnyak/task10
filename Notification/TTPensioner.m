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
    }
    return self;
}

- (void)pensionLevelNotification:(NSNotification *)notification {
    NSLog(@"pensionLevelNotification");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
