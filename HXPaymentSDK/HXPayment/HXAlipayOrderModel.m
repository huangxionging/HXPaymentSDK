//
//  HXAlipayOrderModel.m
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "HXAlipayOrderModel.h"
#import "DataSigner.h"

static NSString *RSAPrivateKey = @"";

@implementation HXAlipayOrderModel

#pragma mark- 通过字典创建
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    return nil;
}

#pragma mark- 描述信息
- (NSString *)description {
    
    NSMutableString *orderString = [NSMutableString string];
    
    // 支付宝接口 mobile.securitypay.pay
    if (self.service) {
        [orderString appendFormat: @"service=\"%@\"", self.service];
    }
    
    // 合作伙伴信息
    if (self.partner) {
        [orderString appendFormat: @"&partner=\"%@\"", self.partner];
    }
    
    // 字符编码
    if (self.inputCharset) {
        [orderString appendFormat: @"&_input_charset=\"%@\"", self.inputCharset];
    }
    
    // 异步通知 URL
    if (self.notifyURL) {
        [orderString appendFormat: @"&notify_url=\"%@\"", self.notifyURL];
    }
    
    // appid
    if (self.appID) {
        [orderString appendFormat: @"&app_id=\"%@\"", self.appID];
    }
    
    // appnv
    if (self.appenv) {
        [orderString appendFormat: @"&appenv=\"%@\"", self.appenv];
    }
    
    // 订单号
    if (self.tradeNumber) {
        [orderString appendFormat: @"&out_trade_no=\"%@\"", self.tradeNumber];
    }
    
    // 商品名称
    if (self.productName) {
        [orderString appendFormat: @"&subject=\"%@\"", self.productName];
    }
    
    // 支付类型
    if (self.paymentType) {
        [orderString appendFormat: @"&payment_type=\"%@\"", self.paymentType];
    }
    
    // 商家 id
    if (self.seller) {
        [orderString appendFormat: @"&seller_id=\"%@\"", self.seller];
    }
    
    // 价格
    if (self.amount) {
        [orderString appendFormat: @"&total_fee=\"%@\"", self.amount];
    }
    
    // 商品详情
    if (self.productDescription) {
        [orderString appendFormat: @"&body=\"%@\"", self.productDescription];
    }
    
    // 商品类型
    if (self.goodsType) {
        [orderString appendFormat: @"&goods_type=\"%@\"", self.goodsType];
    }
    
    // 实名校验
    if (self.realNameCheck) {
        [orderString appendFormat: @"&rn_check=\"%@\"", self.realNameCheck];
    }
    
    // 未付款超时时间
    if (self.itBPay) {
        [orderString appendFormat: @"&it_b_pay=\"%@\"", self.itBPay];
    }
    
    if (self.showUrl) {
        [orderString appendFormat:@"&show_url=\"%@\"",self.showUrl];//m.alipay.com
    }
    if (self.rsaDate) {
        [orderString appendFormat:@"&sign_date=\"%@\"",self.rsaDate];
    }

    for (NSString * key in [self.extraParams allKeys]) {
        [orderString appendFormat:@"&%@=\"%@\"", key, [self.extraParams objectForKey:key]];
    }
    
    return orderString;
}

#pragma mark- 签名
- (NSString *)signRSAForAlipayOrderMOdel {
    // 待签名数据
    NSString *sourceString = [self description];
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(RSAPrivateKey);
    
    NSAssert(signer, @"签名失败");
    
    NSString *signedString = [signer signString: sourceString];
    
    if (signedString) {
        
        return [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       sourceString, signedString, @"RSA"];
    }
    
    return nil;
}


@end
