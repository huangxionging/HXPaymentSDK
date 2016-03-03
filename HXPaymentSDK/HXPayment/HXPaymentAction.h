//
//  HXPaymentAction.h
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void(^<#name#>)(<#arguments#>);

/**
 *  @author huangxiong, 2016/03/02 11:49:07
 *
 *  @brief 支付操作的基类
 *
 *  @since 1.0
 */
@interface HXPaymentAction : NSObject

/**
 *  @author huangxiong, 2016/03/02 11:50:18
 *
 *  @brief 支付名.如 @"Alipay", @"WeChatpay", @"Unionpay"
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *payName;

/**
 *  @author huangxiong, 2016/03/02 11:55:54
 *
 *  @brief 订单信息
 *
 *  @since 1.0
 */
@property (nonatomic, readonly,strong) id orderInfo;

//@property (nonatomic, strong)
/**
 *  @author huangxiong, 2016/03/02 14:17:01
 *
 *  @brief 通过订单信息创建支付操作
 *
 *  @param orderInfo 订单信息
 *
 *  @return 支付操作
 *
 *  @since 1.0
 */
+ (instancetype) paymentActionWithOrderInfo: (id) orderInfo;
/**
 *  @author huangxiong, 2016/03/02 14:32:09
 *
 *  @brief 支付
 *
 *  @since 1.0
 */
- (BOOL) payment;


@end
