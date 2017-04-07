//
//  UsedInXibViewController.m
//  BinButtonDemo
//
//  Created by jerryzhang on 17/4/5.
//  Copyright © 2017年 jerryzhang. All rights reserved.
//

#import "UsedInXibViewController.h"

@interface UsedInXibViewController ()

@end

@implementation UsedInXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.b1.buttonStyle = BinButtonStyleTitleRight;
    self.b1.titleRightMargin = 10.f;
}

- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
