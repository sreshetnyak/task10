//
//  TTViewController.m
//  Notification
//
//  Created by sergey on 2/2/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTGovernment.h"
#import "TTDoctor.h"
#import "TTBusinessman.h"
#import "TTPensioner.h"

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    TTGovernment *government = [[TTGovernment alloc]initGovernmentWithPensionLevel:1500 taxesLevel:5 salaryLevel:4000 averagePrice:25];
    TTDoctor *doctor = [[TTDoctor alloc]init];
    TTBusinessman *bisinesman = [[TTBusinessman alloc]init];
    TTPensioner *pensioner = [[TTPensioner alloc]init];
    
    
//    government.pensionLevel = 1600;
//    government.taxesLevel = 4;
//    government.salaryLevel = 4200;
//    government.averagePrice = 25;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
