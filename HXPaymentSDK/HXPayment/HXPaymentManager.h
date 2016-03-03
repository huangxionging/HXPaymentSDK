//
//  HXPaymentManager.h
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, HXPaymentType) {
    // 支付宝支付
    kHXPaymentTypeAlipay = 10001,
    // 微信支付
    kHXPaymentTypeWechatpay = 10002,
    // 银联支付
    kHXPaymentTypeUnionpay = 10003,
};

const static NSString *alipay = @"";

/**
 *  @author huangxiong, 2016/03/02 11:44:19
 *
 *  @brief 支付管理器, 集成支付工具
 *
 *  @since 1.0
 */
@interface HXPaymentManager : NSObject

/**
*  @author huangxiong, 2016/03/02 11:43:18
*
*  @brief 支付类型, 支付方式
*
*  @since 1.0
*/
@property (nonatomic, assign) HXPaymentType *paymentType;

- (instancetype)init;

@end
