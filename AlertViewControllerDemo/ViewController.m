//
//  ViewController.m
//  AlertViewControllerDemo
//
//  Created by admin on 16/4/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showAction:(id)sender {
    
//    [AlertViewHelper showSingleAlertViewWith:self title:@"showTitle" message:@"showMessage" buttonTitle:@"showBtn" buttonStyle:AlertActionStyleDefault singleBlock:^(UIAlertAction *action) {
//        NSLog(@"点击单个按钮按钮的事件");
//    }];
    
    [AlertViewHelper showCancelAndSureBtnAlertViewWith:self title:@"cancel&Sure" message:@"cancelMessage&SureMessage"   cancelBlock:^(UIAlertAction *cancelAction) {
        NSLog(@"取消了事件");
    } sureBlock:^(UIAlertAction *cancelAction) {
        NSLog(@"确定了事件");
    }];
}

#pragma mark - 随机色
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:0.3f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
