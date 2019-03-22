//
//  TodayViewController.m
//  widgedDemoWidgedToday
//
//  Created by 贾书唱的macbook on 2019/3/21.
//  Copyright © 2019年 jsc. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
//    NSLog(@"height===%f,width====%f",self.view.frame.size.height,self.view.frame.size.width);
    
    
    if ([[UIDevice currentDevice] systemVersion].intValue >= 10) {
        //高度固定，最低高度为110
        //        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
        //折叠，高度可变
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    }
    //貌似这个实在ios8下才有用，如果在ios10后，这个设置高度没有用，系统固定高度，待测
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
    [self setupUI];
}
- (void)setupUI{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn1 setTitle:@"设备1名称" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(10, 0, 100, 55);
    [self.view addSubview:btn1];
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *onBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [onBtn1 setTitle:@"on" forState:UIControlStateNormal];
    onBtn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [onBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    onBtn1.layer.masksToBounds = YES;
    onBtn1.layer.cornerRadius = 35.0/2;
    onBtn1.backgroundColor = [UIColor greenColor];
    onBtn1.frame = CGRectMake(200, 10, 35, 35);
    [self.view addSubview:onBtn1];
    [onBtn1 addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *offBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [offBtn1 setTitle:@"off" forState:UIControlStateNormal];
    offBtn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [offBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    offBtn1.layer.masksToBounds = YES;
    offBtn1 .layer.cornerRadius = 35.0/2;
    offBtn1.backgroundColor = [UIColor redColor];
    offBtn1.frame = CGRectMake(275, 10, 35, 35);
    [self.view addSubview:offBtn1];
    [offBtn1 addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView1];
    lineView1.frame = CGRectMake(0, 55, self.view.frame.size.width, 0.5);

    
    /***
     
     */
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 setTitle:@"设备2名称" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(10, 0+55, 100, 55);
    [self.view addSubview:btn2];
    
    UIButton *onBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [onBtn2 setTitle:@"on" forState:UIControlStateNormal];
    onBtn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [onBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    onBtn2.layer.masksToBounds = YES;
    onBtn2.layer.cornerRadius = 35.0/2;
    onBtn2.backgroundColor = [UIColor greenColor];
    onBtn2.frame = CGRectMake(200, 10+55, 35, 35);
    [self.view addSubview:onBtn2];
    [onBtn2 addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *offBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [offBtn2 setTitle:@"off" forState:UIControlStateNormal];
    offBtn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [offBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    offBtn2.layer.masksToBounds = YES;
    offBtn2 .layer.cornerRadius = 35.0/2;
    offBtn2.backgroundColor = [UIColor redColor];
    offBtn2.frame = CGRectMake(275, 10+55, 35, 35);
    [self.view addSubview:offBtn2];
    [offBtn2 addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView2];
    lineView2.frame = CGRectMake(0, 55+55, self.view.frame.size.width, 0.5);
    /***
     
     */
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn3 setTitle:@"设备2名称" forState:UIControlStateNormal];
    btn3.frame = CGRectMake(10, 0+55+55, 100, 55);
    [self.view addSubview:btn3];
    
    UIButton *onBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [onBtn3 setTitle:@"on" forState:UIControlStateNormal];
    onBtn3.titleLabel.font = [UIFont systemFontOfSize:14];
    [onBtn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    onBtn3.layer.masksToBounds = YES;
    onBtn3.layer.cornerRadius = 35.0/2;
    onBtn3.backgroundColor = [UIColor greenColor];
    onBtn3.frame = CGRectMake(200, 10+55+55, 35, 35);
    [self.view addSubview:onBtn3];
    [onBtn3 addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *offBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [offBtn3 setTitle:@"off" forState:UIControlStateNormal];
    offBtn3.titleLabel.font = [UIFont systemFontOfSize:14];
    [offBtn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    offBtn3.layer.masksToBounds = YES;
    offBtn3 .layer.cornerRadius = 35.0/2;
    offBtn3.backgroundColor = [UIColor redColor];
    offBtn3.frame = CGRectMake(275, 10+55+55, 35, 35);
    [self.view addSubview:offBtn3];
    [offBtn3 addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView3];
    lineView3.frame = CGRectMake(0, 55+55+55, self.view.frame.size.width, 0.5);
    
    //
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:moreBtn];
    [moreBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    moreBtn.frame = CGRectMake(0, 55+55+55, self.view.frame.size.width, 220-55-55-55);

}
- (void)onBtnClick:(UIButton *)btn{
    if ([btn.titleLabel.text isEqualToString:@"on"]) {
        NSLog(@"点击开启按钮，做相关操作");
    }else{
        NSLog(@"点击关闭按钮，做相关操作");
    }
}
- (void)btnClick{
    //scheme为app的scheme
    [self.extensionContext openURL:[NSURL URLWithString:@"widgedDemo://equipment"]
                 completionHandler:^(BOOL success) {
                     NSLog(@"open url result:%d",success);
                 }];
//    [self.extensionContext openURL:[NSURL URLWithString:@"widgedDemo://token=123456"]
//                 completionHandler:^(BOOL success) {
//                     NSLog(@"open url result:%d",success);
//                 }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {

    completionHandler(NCUpdateResultNewData);
}
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {

    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {

    if (activeDisplayMode == NCWidgetDisplayModeCompact) {

        self.preferredContentSize = CGSizeMake(maxSize.width, 110);
    }
    else {

        self.preferredContentSize = CGSizeMake(maxSize.width, 210);
    }
}
@end
