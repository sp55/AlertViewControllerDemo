//
//  AlertViewHelper.h
//  AlertViewControllerDemo
//
//  Created by admin on 16/4/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//


//iOS8以上

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  弹框显示的时间，默认1秒
 */

#define kAlertViewShowTime 1.0

/**
 *  检测系统版本
 */

#define iOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  单个按钮的点击事件
 */
typedef void(^SingleButtonAlertViewBlock)(UIAlertAction *action);

/**
 *  取消按钮和确定按钮
 */
typedef void(^CancelButtonAlertViewBlock)(UIAlertAction *cancelAction);
typedef void(^SureButtonAlertViewBlock)(UIAlertAction *cancelAction);




@interface AlertViewHelper : NSObject

/**
 *  简易（最多支持单一按钮,按钮无执行响应）alert定义 兼容适配
 *
 *  @param viewController       当前视图，alertController模态弹出的指针
 *  @param title                标题
 *  @param message              信息
 *  @param btnTitle             按钮标题
 *  @param btnStyle             按钮样式
 */
+ (void)showSingleAlertViewWith:(UIViewController *)viewController
                       title:(NSString *)title
                     message:(NSString *)message
                 buttonTitle:(NSString *)btnTitle
                 singleBlock:(SingleButtonAlertViewBlock)block;


/**
 *  @param viewController       当前视图，alertController模态弹出的指针
 *  @param title                标题
 *  @param message              信息
 *  @param cancelBlock          取消事件
 *  @param sureBlock            确定事件
 */
+ (void)showCancelAndSureBtnAlertViewWith:(UIViewController *)viewController
                          title:(NSString *)title
                        message:(NSString *)message
                    cancelBlock:(CancelButtonAlertViewBlock)cancelblock
                    sureBlock:(SureButtonAlertViewBlock)sureblock;



@end
