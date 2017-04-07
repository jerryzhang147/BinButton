//
//  UsedInXibViewController.h
//  BinButtonDemo
//
//  Created by jerryzhang on 17/4/5.
//  Copyright © 2017年 jerryzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BinButton.h"

@interface UsedInXibViewController : UIViewController
@property (weak, nonatomic) IBOutlet BinButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *goBackButton;

@end
