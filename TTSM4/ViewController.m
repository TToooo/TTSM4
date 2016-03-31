//
//  ViewController.m
//  TTSM4
//
//  Created by 王涛 on 3/31/16.
//  Copyright © 2016 王涛. All rights reserved.
//

#import "ViewController.h"
#import "TTAlgorithmSM4.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self cbc];
//    [self ecb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//CBC模式示例
- (void)cbc
{
    //密钥
    NSString *secretKey = @"JeF8U9wHFOMfs2Y8";
    //初始化向量
    NSString *iv = @"UISwD9fW6cFh9SNS";
    
    TTAlgorithmSM4 *sm4 = [TTAlgorithmSM4 cbcSM4WithKey:secretKey iv:iv];
    
    NSDictionary *msgDic = @{@"name":@"TTwong", @"country":@"中国"};
    NSError *error;
    NSData *msgData = [NSJSONSerialization dataWithJSONObject:msgDic options:0 error:&error];
    NSString *msgString = [[NSString alloc]initWithData:msgData encoding:NSUTF8StringEncoding];
    NSLog(@"明文: %@", msgString);
    
    NSString *encryptionString = [sm4 encryption:msgString];
    NSLog(@"加密: %@", encryptionString);
    
    
    NSString *decryptionString = [sm4 decryption:encryptionString];
    NSLog(@"解密: %@", decryptionString);
    
    NSMutableData *msgdata = [[NSMutableData alloc]initWithData:[decryptionString dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:msgdata options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"dic : %@", dic);
}


//ECB模式示例
- (void)ecb
{
    //密钥
    NSString *secretKey = @"JeF8U9wHFOMfs2Y8";
    
    TTAlgorithmSM4 *sm4 = [TTAlgorithmSM4 ecbSM4WithKey:secretKey];
    
    NSDictionary *msgDic = @{@"name":@"TTwong", @"country":@"中国"};
    NSError *error;
    NSData *msgData = [NSJSONSerialization dataWithJSONObject:msgDic options:0 error:&error];
    NSString *msgString = [[NSString alloc]initWithData:msgData encoding:NSUTF8StringEncoding];
    NSLog(@"明文: %@", msgString);
    
    NSString *encryptionString = [sm4 encryption:msgString];
    NSLog(@"加密: %@", encryptionString);
    
    
    NSString *decryptionString = [sm4 decryption:encryptionString];
    NSLog(@"解密: %@", decryptionString);
    
    NSMutableData *msgdata = [[NSMutableData alloc]initWithData:[decryptionString dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:msgdata options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"dic : %@", dic);
}

@end
