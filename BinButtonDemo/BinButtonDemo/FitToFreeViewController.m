//
//  FitToFreeViewController.m
//  BinButtonDemo
//
//  Created by jerryzhang on 17/3/18.
//  Copyright © 2017年 jerryzhang. All rights reserved.
//

#import "FitToFreeViewController.h"
#import "BinButton.h"

@interface FitToFreeViewController ()
@property (nonatomic, strong) BinButton *b1;
@property (nonatomic, strong) BinButton *b2;
@property (nonatomic, strong) BinButton *b3;
@end

@implementation FitToFreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BinButton *b1 = [BinButton buttonWithStyle:BinButtonStyleHorizontalImageLeftTitleCenter frame:CGRectMake(0, 0, 240, 40)];
    b1.imageLeftMargin = 10.f;
    b1.backgroundColor = [UIColor greenColor];
    b1.center = CGPointMake(self.view.center.x, 50.f);
    [b1 addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [b1 sizeToFitAtHorizontal];
    [b1 sizeToFitAtVertical];
    [self.view addSubview:b1];
    self.b1 = b1;
    
    BinButton *b2 = [BinButton buttonWithStyle:BinButtonStyleHorizontalReverseImageCenterTitleCenter frame:CGRectMake(0, 0, 240, 40)];
    b2.backgroundColor = [UIColor greenColor];
    b2.center = CGPointMake(self.view.center.x, 100.f);
    [b2 addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [b2 sizeToFitAtHorizontal];
    [b2 sizeToFitAtVertical];
    [self.view addSubview:b2];
    self.b2 = b2;
    
    BinButton *b3 = [BinButton buttonWithStyle:BinButtonStyleVerticalImageTopTitleCenter frame:CGRectMake(0, 0, 240, 100.f)];
    b3.backgroundColor = [UIColor greenColor];
    b3.imageTopMargin = 10.f;
    b3.center = CGPointMake(self.view.center.x, 180.f);
    [b3 addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [b3 sizeToFitAtHorizontal];
    [b3 sizeToFitAtVertical];
    [self.view addSubview:b3];
    self.b3 = b3;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 260, 120, 40);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"FitToFreeInHorizontal" forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width - 120 - 20.f, 260, 120, 40.f);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:@"FitToFreeInVertical" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btn1 {
    CGRect tempRect = self.b1.frame;
    tempRect.size.width = 200.f;
    tempRect.size.height = 40.f;
    self.b1.frame = tempRect;
    self.b1.imageLeftMargin = 20.f;
    [self.b1 sizeToFreeAtHorizontal];
    
    tempRect = self.b2.frame;
    tempRect.size.width = 240.f;
    tempRect.size.height = 40.f;
    self.b2.frame = tempRect;
    [self.b2 sizeToFreeAtHorizontal];
    
    tempRect = self.b3.frame;
    tempRect.size.width = 240.f;
    tempRect.size.height = 100.f;
    self.b3.frame = tempRect;
    [self.b3 sizeToFreeAtHorizontal];
}

- (void)btn2 {
    CGRect tempRect = self.b1.frame;
    tempRect.size.width = 200.f;
    tempRect.size.height = 40.f;
    self.b1.frame = tempRect;
    [self.b1 sizeToFreeAtVertical];
    
    tempRect = self.b2.frame;
    tempRect.size.width = 240.f;
    tempRect.size.height = 40.f;
    self.b2.frame = tempRect;
    [self.b2 sizeToFreeAtVertical];
    
    tempRect = self.b3.frame;
    tempRect.size.width = 240.f;
    tempRect.size.height = 100.f;
    self.b3.frame = tempRect;
    [self.b3 sizeToFreeAtVertical];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
