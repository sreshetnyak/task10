//
//  TTBusinessman.h
//  Notification
//
//  Created by sergey on 2/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTBusinessman : NSObject

@property (strong,nonatomic) NSString *name;

@property (assign,nonatomic) CGFloat taxesLevel;
@property (assign,nonatomic) CGFloat averagePrice;
@property (assign,nonatomic) CGFloat inflation;

@end
