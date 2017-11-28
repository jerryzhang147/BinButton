//
//  OtherViewController.m
//  BinButtonDemo
//
//  Created by jerryzhang on 2017/11/27.
//  Copyright © 2017年 jerryzhang. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()
@property (nonatomic, strong) BinButton *button;

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self demoOne];
}

- (void)demoOne {
    BinButton *button = [BinButton buttonWithButtonStyle:BinButtonStyleHorizontalImageCenterTitleRight];
    button.backgroundColor = [UIColor greenColor];
    button.frame = CGRectMake(20, 20, 300, 50.f);
    button.titleRightMargin = 10.f;
    [self.view addSubview:button];
//    [button sizeToFitAtHorizontal];
    self.button = button;
}

@end
