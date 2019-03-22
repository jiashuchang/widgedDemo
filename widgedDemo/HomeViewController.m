//
//  HomeViewController.m
//  widgedDemo
//
//  Created by 贾书唱的macbook on 2019/3/21.
//  Copyright © 2019年 jsc. All rights reserved.
//

#import "HomeViewController.h"
#import "EquipmentViewController.h"
#import "FriendsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"设备列表" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(10, 100, 80, 50);
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"好友列表" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(10, 200, 80, 50);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}
- (void)btn1Click{
    EquipmentViewController *equipmentVC = [[EquipmentViewController alloc] init];
    [self.navigationController pushViewController:equipmentVC animated:YES];
}
- (void)btn2Click{
    FriendsViewController *friendsVC = [[FriendsViewController alloc] init];
    [self.navigationController pushViewController:friendsVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
