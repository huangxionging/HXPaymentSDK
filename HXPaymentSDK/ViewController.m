//
//  ViewController.m
//  HXPaymentSDK
//
//  Created by huangxiong on 16/3/2.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "ViewController.h"
#import "HXPaymentAlipayAction.h"
#import "HXPayment/HXAlipayOrderModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payment:(id)sender {
    
    HXAlipayOrderModel *order = [[HXAlipayOrderModel alloc] init];
    // 合作 id
    order.partner = @"2088121943149222";
    // 商家
    order.seller = @"chenxu@movnow.com";
    // 价格
    order.amount = @"50";
    // 字符集
    order.inputCharset = @"utf-8";
    // 支付类型
    order.paymentType = @"1";
    // 超时
    order.itBPay = @"10m";
    // 异步通知
    order.notifyURL = @"http://web.sns.movnow.com/ali/notify_url.php";
    // 服务接口
    order.service = @"mobile.securitypay.pay";
    // 商品
    order.productName = @"公交充值";
    // 商品描述
    order.productDescription = @"深圳通公交充值";
    // 订单 id
    order.tradeNumber = [NSString stringWithFormat: @"%@", @(arc4random() * 1000000 + 10000000)];
    HXPaymentAlipayAction *action = [HXPaymentAlipayAction paymentActionWithOrderInfo: order];
    
    BOOL isPay = [action payment];
    
    if (isPay) {
        NSLog(@"签名正确");
    }
}
@end
