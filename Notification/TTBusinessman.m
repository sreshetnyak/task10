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
    }
    return self;
}

- (void)taxesLevelNotification:(NSNotification *)notification {
    NSLog(@"taxesLevelNotification");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
