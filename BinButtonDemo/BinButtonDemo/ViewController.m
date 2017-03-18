//
//  ViewController.m
//  BinButtonDemo
//
//  Created by jerryzhang on 17/3/18.
//  Copyright © 2017年 jerryzhang. All rights reserved.
//

#import "ViewController.h"
#import "FreeToFitViewController.h"
#import "FitToFreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)freeToFitAction:(id)sender {
    [self presentViewController:[FreeToFitViewController new] animated:YES completion:nil];
}

- (IBAction)fitToFreeAction:(id)sender {
    [self presentViewController:[FitToFreeViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
