//
//  HXAlipayOrderModel.h
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author huangxiong, 2016/03/02 15:03:29
 *
 *  @brief 支付宝支付订单模型, 如非特殊说明, 皆为必选参数, 可选参数会特别说明
 *
 *  @since 1.0
 */
@interface HXAlipayOrderModel : NSObject

/**
 *  @author huangxiong, 2016/03/02 16:54:52
 *
 *  @brief 接口名称，固定值 mobile.securitypay.pay
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *service;

/**
 *  @author huangxiong, 2016/03/02 15:50:19
 *
 *  @brief 商家合作 id, 与支付宝签约时的 16位数字, 以2088开头
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *partner;

/**
 *  @author huangxiong, 2016/03/02 16:58:36
 *
 *  @brief 商户网站使用的编码格式，固定为utf-8。
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *inputCharset;

/**
 *  @author huangxiong, 2016/03/02 16:59:24
 *
 *  @brief 签名类型, 目前仅支持RSA。
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *signType;

/**
 *  @author huangxiong, 2016/03/02 17:00:15
 *
 *  @brief 签名, 仅支持 RSA 方式
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *sign;

/**
 *  @author huangxiong, 2016/03/02 17:14:40
 *
 *  @brief 回调通知地址
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *notifyURL;

/**
 *  @author huangxiong, 2016/03/02 17:16:53
 *
 *  @brief app 标识客户端, 注意是可选。
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *appID;

/**
 *  @author huangxiong, 2016/03/02 17:46:16
 *
 *  @brief 可选参数, 标识客户端来源。参数值内容约定如下：appenv=”system=客户端平台名^version=业务系统版本”
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *appenv;

/**
 *  @author huangxiong, 2016/03/02 16:05:32
 *
 *  @brief 订单 id, 由商家自己确定
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *tradeNumber;

/**
 *  @author huangxiong, 2016/03/02 16:52:04
 *
 *  @brief 产品名称
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *productName;

/**
 *  @author huangxiong, 2016/03/02 18:13:30
 *
 *  @brief 支付类型, 默认值为 1
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *paymentType;
 
/**
 *  @author huangxiong, 2016/03/02 16:03:24
 *
 *  @brief 商家 id, 与支付宝签约的账号
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *seller;

/**
 *  @author huangxiong, 2016/03/02 16:53:51
 *
 *  @brief 价格
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *amount;


/**
 *  @author huangxiong, 2016/03/02 16:53:17
 *
 *  @brief 商品描述
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *productDescription;

/**
 *  @author huangxiong, 2016/03/02 18:16:09
 *
 *  @brief 商品类型
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *goodsType;

/**
 *  @author huangxiong, 2016/03/02 19:59:39
 *
 *  @brief 实名校验, 可选
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *realNameCheck;

/**
 *  @author huangxiong, 2016/03/03 09:33:55
 *
 *  @brief 设置超时时间: 例: @"30m"
 *
 *  @since 1.0
 */
@property (nonatomic, copy) NSString *itBPay;

/**
 *  @author huangxiong, 2016/03/03 09:56:38
 *
 *  @brief 展示页面地址, 可选
 *
 *  @since 1.0
 */
@property(nonatomic, copy) NSString *showUrl;

/**
 *  @author huangxiong, 2016/03/03 09:57:24
 *
 *  @brief rsa 日期, 可选
 *
 *  @since 1.0
 */
@property(nonatomic, copy) NSString *rsaDate;

/**
 *  @author huangxiong, 2016/03/03 09:58:02
 *
 *  @brief 额外参数
 *
 *  @since 1.0
 */
@property(nonatomic, readonly) NSMutableDictionary *extraParams;

/**
 *  @author huangxiong, 2016/03/02 15:06:31
 *
 *  @brief 通过字典创建订单模型
 *
 *  @param dictionary 订单字典
 *
 *  @return 订单模型
 *
 *  @since 1.0
 */
+ (instancetype) modelWithDictionary: (NSDictionary *) dictionary;

/**
 *  @author huangxiong, 2016/03/03 10:02:10
 *
 *  @brief 获取签名之后的订单数据
 *
 *  @return 签名之后的订单数据
 *
 *  @since 1.0
 */
- (NSString *)signRSAForAlipayOrderMOdel;

@end
