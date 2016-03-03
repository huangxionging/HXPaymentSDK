//
//  HXPaymentAlipayAction.m
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "HXPaymentAlipayAction.h"
#import "HXAlipayOrderModel.h"
#import <AlipaySDK/AlipaySDK.h>

@interface HXPaymentAlipayAction ()

@property (nonatomic, strong) HXAlipayOrderModel *orderModel;

@end

@implementation HXPaymentAlipayAction

+ (instancetype)paymentActionWithOrderInfo:(id)orderInfo {
    HXPaymentAlipayAction *paymentAction = [super paymentActionWithOrderInfo:orderInfo];

    if (paymentAction) {
        
        if ([orderInfo isKindOfClass: [HXAlipayOrderModel class]]) {
            paymentAction.orderModel = orderInfo;
        } else if ([orderInfo isKindOfClass: [NSDictionary class]]) {
            
        }
    }
    
    return paymentAction;
}

- (void)setOrderModel:(HXAlipayOrderModel *)orderModel {
    _orderModel = orderModel;
}

- (BOOL)payment {
    
    // 调用支付接口
    NSString *orderString = [self.orderModel signRSAForAlipayOrderMOdel];
    
    if (!orderString) {
        NSLog(@"订单签名失败");
        return NO;
    }
    
    [[AlipaySDK defaultService] payOrder: orderString fromScheme: @"alipay" callback:^(NSDictionary *resultDic) {
        NSLog(@"%@", resultDic);
    }];
    
    return YES;
}

@end
