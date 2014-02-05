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
#import "TTAplicationDelegate.h"



@interface TTViewController ()

@property (strong,nonatomic) TTBusinessman *bisinesman;
@property (strong,nonatomic) TTDoctor *doctor;
@property (strong,nonatomic) TTPensioner *pensioner;
@property (strong,nonatomic) TTGovernment *government;
@property (strong,nonatomic) TTAplicationDelegate *myAplicationDelegate;

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _myAplicationDelegate = [[TTAplicationDelegate alloc]init];
    _doctor = [[TTDoctor alloc]init];
    _bisinesman = [[TTBusinessman alloc]init];
    _pensioner = [[TTPensioner alloc]init];
    [_doctor setName:@"Evgeniy"];
    [_bisinesman setName:@"Georgiy"];
    [_pensioner setName:@"Dmitriy"];
    
    _government = [[TTGovernment alloc]initGovernmentWithPensionLevel:1500 taxesLevel:5 salaryLevel:4000 averagePrice:25];
    
    _government.pensionLevel = 1600;
    _government.taxesLevel = 4;
    _government.salaryLevel = 4200;
    _government.averagePrice = 24;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
