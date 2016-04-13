//
//  AlertViewHelper.m
//  AlertViewControllerDemo
//
//  Created by admin on 16/4/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "AlertViewHelper.h"

@implementation AlertViewHelper

#pragma mark - alert 简易提示窗 一个按钮或者无按钮
+ (void)showSingleAlertViewWith:(UIViewController *)viewController
                       title:(NSString *)title
                     message:(NSString *)message
                 buttonTitle:(NSString *)btnTitle
                 singleBlock:(SingleButtonAlertViewBlock)block
{
    if (iOS_VERSION >= 8.0)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *singleAction  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            block(action);
        }];
        [alertController addAction:singleAction];

        [viewController presentViewController:alertController animated:YES completion:nil];
        
        //如果没有按钮，自动延迟消失
        if (btnTitle == nil) {
            //此时self指本类
            [self performSelector:@selector(dismissAlertController:) withObject:alertController afterDelay:kAlertViewShowTime];
        }
    }
}

+ (void)showCancelAndSureBtnAlertViewWith:(UIViewController *)viewController
                                    title:(NSString *)title
                                  message:(NSString *)message
                              cancelBlock:(CancelButtonAlertViewBlock)cancelblock
                                sureBlock:(SureButtonAlertViewBlock)sureblock{

    if (iOS_VERSION >= 8.0)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            cancelblock(action);
        }];
        [alertController addAction:cancelAction];
        UIAlertAction *sureAction  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            sureblock(action);
        }];
        [alertController addAction:sureAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
        //如果没有按钮，自动延迟消失
        if (title == nil) {
            //此时self指本类
            [self performSelector:@selector(dismissAlertController:) withObject:alertController afterDelay:kAlertViewShowTime];
        }

    }

}
+ (void)dismissAlertController:(UIAlertController *)alert
{
    [alert dismissViewControllerAnimated:YES completion:nil];
}

@end
