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

#import "UsedInXibViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"FreeToFit";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"FitToFree";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"UsedInXib";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self presentViewController:[FreeToFitViewController new] animated:YES completion:nil];
    } else if (indexPath.row == 1) {
        [self presentViewController:[FitToFreeViewController new] animated:YES completion:nil];
    } else if (indexPath.row == 2) {
        [self presentViewController:[UsedInXibViewController new] animated:YES completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
