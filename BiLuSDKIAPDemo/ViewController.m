//
//  ViewController.m
//  BiLuSDKIAPDemo
//
//  Created by ALLW on 2019/11/14.
//  Copyright © 2019 bilu. All rights reserved.
//

#import "ViewController.h"
#import <BiLuSDKIAP/BiLuSDKIAP.h>

@interface ViewController ()

@property (nonatomic ,strong)UITextField * tf1;
@property (nonatomic ,strong)UITextField * tf2;
@property (nonatomic ,strong)UITextField * tf3;
@property (nonatomic ,strong)UITextField * tf4;
@property (nonatomic ,strong)UITextField * tf5;
@property (nonatomic ,strong)UITextField * tf6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    [self creatView];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void)creatView {

    [self creatList];
}



- (void)creatList {



    _tf1 = [[UITextField alloc]init];
    [self.view addSubview:_tf1];

    _tf2 = [[UITextField alloc]init];
    [self.view addSubview:_tf2];

    _tf3 = [[UITextField alloc]init];
    [self.view addSubview:_tf3];

    _tf4 = [[UITextField alloc]init];
    [self.view addSubview:_tf4];

    _tf5 = [[UITextField alloc]init];
    [self.view addSubview:_tf5];

    _tf6 = [[UITextField alloc]init];
    [self.view addSubview:_tf6];

    CGFloat w = 300;
    CGFloat h = 44;

    _tf1.frame = CGRectMake(15, 100, w, h);
    _tf2.frame = CGRectMake(15, CGRectGetMaxY(_tf1.frame) + 10, w, h);
    _tf3.frame = CGRectMake(15, CGRectGetMaxY(_tf2.frame) + 10, w, h);
    _tf4.frame = CGRectMake(15, CGRectGetMaxY(_tf3.frame) + 10, w, h);
    _tf5.frame = CGRectMake(15, CGRectGetMaxY(_tf4.frame) + 10, w, h);
    _tf6.frame = CGRectMake(15, CGRectGetMaxY(_tf5.frame) + 10, w, h);


    _tf1.placeholder = @"orderId 订单id 或者 AppStore 支付产品ID";
    _tf2.placeholder = @"iapId  充值包id  ";
    _tf3.placeholder = @"currencyAmount  现金金额 ";
    _tf4.placeholder = @"currencyType   币种 ";
    _tf5.placeholder = @"virtualCurrencyAmount 虚拟币金额 ";
    _tf6.placeholder = @"paymentType  支付类型 ";

    UIColor * color = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];

    _tf1.backgroundColor = color;
    _tf2.backgroundColor = color;
    _tf3.backgroundColor = color;
    _tf4.backgroundColor = color;
    _tf5.backgroundColor = color;
    _tf6.backgroundColor = color;


    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_tf6.frame) + 30, 70, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(onChargeRequst) forControlEvents:UIControlEventTouchUpInside];

    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(_tf6.frame) + 30, 70, 40)];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"完成" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(onChargeSuccess) forControlEvents:UIControlEventTouchUpInside];

    UIButton * btn3 = [[UIButton alloc]initWithFrame:CGRectMake(180, CGRectGetMaxY(_tf6.frame) + 30, 120, 40)];
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitle:@"内购支付" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(IAPBtnAction) forControlEvents:UIControlEventTouchUpInside];
}


- (void)onChargeRequst {


    [BiLuVirtualCurrency onChargeRequst:_tf1.text
                                  iapId:_tf2.text
                         currencyAmount:[_tf3.text floatValue]
                           currencyType:_tf4.text
                  virtualCurrencyAmount:[_tf5.text floatValue]
                            paymentType:_tf6.text];
}

- (void)onChargeSuccess {


    [BiLuVirtualCurrency onChargeSuccess:_tf1.text];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
}


- (void)IAPBtnAction {
    
/// @param productID 内购项目的产品ID
/// @param trackingcode  自定义追踪码（可放置需要绑定回调的数据,可传空）
/// @param type YES返回全部订单，NO返回当前商品订单（默认返回全部订单）
/// @param handle 内购的结果及二次验证回调
    [[BiLuVirtualCurrency shareIAPManager ] startIAPWithProductID:@"Marsplan_diamond_7" trackingcode:@{} type:NO completeHandle:^(BiLuIAPResultType type, NSDictionary * _Nonnull data) {
        NSLog(@"??%lu,%@",(unsigned long)type,data);
    }];
    
    //返回数据结构
    /*
     
     {
         "code": 200,
         "status": "ok",
         "payload": {
             "status": 0,
             "msg": "购买成功",
             "data": [订单数组
                    {
                    "quantity":"1",
                    "product_id":"112701",
                    "transaction_id":"1000000605117325",
                    "original_transaction_id":"1000000605117325",
                    "purchase_date":"2019-12-16 07:24:43 Etc\/GMT","purchase_date_ms":"1576481083429",
                    "purchase_date_pst":"2019-12-15 23:24:43 America\/Los_Angeles",
                    "original_purchase_date":"2019-12-16 07:24:43Etc\/GMT",
                    "original_purchase_date_ms":"1576481083429",
                    "original_purchase_date_pst":"2019-12-15 23:24:43 America\/Los_Angeles",
                    "is_trial_period":"false"
                    }
             ],
       //验证凭证 "receipt_data":"MIIT1QYJKoZIhvcNAQcCoIITxjCCE8ICAQExCzAJBgUrDgMCGgUAMIIDdgYJKoZIhvcNAQcBoIIDZwSCA2MxggNfMAoCAQgCAQEEAhYAMAoCARQCAQEEAgwAMAsCAQECAQEEAwIBADALAgEDAgEBBAMMATEwCwIBCwIBAQQDAgEAMAsCAQ8CAQEEAwIBADALAgEQAgEBBAMCAQAwCwIBGQIBAQQDAgEDMAwCAQoCAQEEBBYCNCswDAIBDgIBAQQEAgIAnTANAgENAgEBBAUCAwHWUDANAgETAgEBBAUMAzEuMDAOAgEJAgEBBAYCBFAyNTMwGAIBAgIBAQQQDA5jbi50a...",
            "custom_scene":"第三方自定义字符串",//第三方自定义字符串
           }
         },
         "version": "500bdb5279c24e6297187202808c1bad"
     }

     
     
     */
}

@end
