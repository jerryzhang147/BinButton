//
//  FreeToFitViewController.m
//  BinButtonDemo
//
//  Created by jerryzhang on 17/3/18.
//  Copyright © 2017年 jerryzhang. All rights reserved.
//

#import "FreeToFitViewController.h"
#import "BinButton.h"

@interface FreeToFitViewController ()
@property (nonatomic, strong) BinButton *b1;
@property (nonatomic, strong) BinButton *b2;
@property (nonatomic, strong) BinButton *b3;
@end

@implementation FreeToFitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BinButton *b1 = [[BinButton alloc] initWithButtonStyle:BinButtonStyleHorizontalImageLeftTitleCenter];
    b1.frame = CGRectMake(0, 0, 240, 40);
    b1.imageLeftMargin = 10.f;
    b1.backgroundColor = [UIColor greenColor];
    b1.center = CGPointMake(self.view.center.x, 50.f);
    [b1 addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b1];
    self.b1 = b1;
    
    BinButton *b2 = [[BinButton alloc] initWithButtonStyle:BinButtonStyleHorizontalReverseImageCenterTitleCenter];
    b2.backgroundColor = [UIColor greenColor];
    b2.frame = CGRectMake(0, 0, 240, 40);
    b2.center = CGPointMake(self.view.center.x, 100.f);
    [b2 addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];
    self.b2 = b2;
    
    BinButton *b3 = [[BinButton alloc] initWithButtonStyle:BinButtonStyleVerticalImageTopTitleCenter];
    b3.frame = CGRectMake(0, 0, 240, 100.f);
    b3.backgroundColor = [UIColor greenColor];
    b3.imageTopMargin = 10.f;
    b3.imageTitleMargin = 20.f;
    b3.center = CGPointMake(self.view.center.x, 180.f);
    [b3 addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b3];
    self.b3 = b3;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 180, 40);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.center = CGPointMake(self.view.center.x, 270.f);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"FreeToFitInHorizontal" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 180, 40.f);
        button.center = CGPointMake(self.view.center.x, 320.f);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:@"FreeToFitInVertical" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    UIButton *goBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    goBackButton.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50.f, [UIScreen mainScreen].bounds.size.width, 50);
    [goBackButton setTitle:@"Go Back" forState:UIControlStateNormal];
    goBackButton.backgroundColor = [UIColor redColor];
    [goBackButton addTarget:self action:@selector(GoBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBackButton];
}

- (void)btn {
    
}

- (void)GoBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btn1 {
    [self.b1 sizeToFitAtHorizontal];
    self.b2.titleLeftMargin = 10.f;
    [self.b2 sizeToFitAtHorizontal];
    [self.b3 sizeToFitAtHorizontal];
}

- (void)btn2 {
    [self.b1 sizeToFitAtVertical];
    [self.b2 sizeToFitAtVertical];
    [self.b3 sizeToFitAtVertical];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
