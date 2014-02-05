//
//  TTAplicationDelegate.m
//  Notification
//
//  Created by sergey on 2/5/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTAplicationDelegate.h"

@implementation TTAplicationDelegate

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationWillResignActive:)
                                                    name:UIApplicationWillResignActiveNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationDidEnterBackground:)
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationWillEnterForeground:)
                                                    name:UIApplicationWillEnterForegroundNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationDidBecomeActive:)
                                                    name:UIApplicationDidBecomeActiveNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationWillTerminate:)
                                                    name:UIApplicationWillTerminateNotification
                                                  object:nil];
    }
    return self;
}

- (void)applicationWillResignActive:(NSNotification *)notification {
    NSLog(@"%@ applicationWillResignActive", [self class]);
}

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    NSLog(@"%@ applicationDidEnterBackground", [self class]);
}

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    NSLog(@"%@ applicationWillEnterForeground", [self class]);
}

- (void)applicationDidBecomeActive:(NSNotification *)notification {
    NSLog(@"%@ applicationDidBecomeActive", [self class]);
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    NSLog(@"%@ applicationWillTerminate", [self class]);
}

@end
