//
//  HXPaymentAction.m
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "HXPaymentAction.h"

@implementation HXPaymentAction

+ (instancetype)paymentActionWithOrderInfo:(id)orderInfo {
    HXPaymentAction *paymentAction = [[super alloc] initWithOrderInfo: orderInfo];
    
    return paymentAction;
}

- (instancetype)initWithOrderInfo:(id)orderInfo {
    
    // 初始化
    self = [super init];
    
    if (self) {
        _orderInfo = orderInfo;
    }
    return self;
}

- (NSString *)payName {
    return NSStringFromClass([self class]);
}

- (BOOL)payment {
    
    // 如果是子类调用
    if ([[self class] isSubclassOfClass: [HXPaymentAction class]]) {
        NSAssert(0, @"子类必须实现该方法");
    }
    
    return YES;
}

@end
