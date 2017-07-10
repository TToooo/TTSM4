# TTSM4
国密算法SM4的OC封装

# Install
pod 'TTSM4', '~> 1.0.0'

# 用法
1.CBC模式：需要密钥和初始化向量来初始化，且长度都为16字节
    //密钥
    NSString *secretKey = @"JeF8U9wHFOMfs2Y8";
    //初始化向量
    NSString *iv = @"UISwD9fW6cFh9SNS";
    
    TTAlgorithmSM4 *sm4 = [TTAlgorithmSM4 cbcSM4WithKey:secretKey iv:iv];
    
    //原始数据
    NSDictionary *msgDic = @{@"name":@"TTwong", @"country":@"中国"};
    NSError *error;
    NSData *msgData = [NSJSONSerialization dataWithJSONObject:msgDic options:0 error:&error];
    //原始字符串
    NSString *msgString = [[NSString alloc]initWithData:msgData encoding:NSUTF8StringEncoding];

    //加密后的字符串
    NSString *encryptionString = [sm4 encryption:msgString];

    //解密后的字符串
    NSString *decryptionString = [sm4 decryption:encryptionString];

    //恢复到原始数据
    NSMutableData *msgdata = [[NSMutableData alloc]initWithData:[decryptionString dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:msgdata options:NSJSONReadingMutableLeaves error:&error];

2.ECB模式：需要密钥来初始化，密钥长度为16字节
	//密钥
    NSString *secretKey = @"JeF8U9wHFOMfs2Y8";
    
    TTAlgorithmSM4 *sm4 = [TTAlgorithmSM4 ecbSM4WithKey:secretKey];
    
    //原始数据
    NSDictionary *msgDic = @{@"name":@"TTwong", @"country":@"中国"};
    NSError *error;
    NSData *msgData = [NSJSONSerialization dataWithJSONObject:msgDic options:0 error:&error];
    NSString *msgString = [[NSString alloc]initWithData:msgData encoding:NSUTF8StringEncoding];
    
    //加密后的字符串
    NSString *encryptionString = [sm4 encryption:msgString];
    
    //解密后的字符串
    NSString *decryptionString = [sm4 decryption:encryptionString];
    
    //恢复到原始数据
    NSMutableData *msgdata = [[NSMutableData alloc]initWithData:[decryptionString dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:msgdata options:NSJSONReadingMutableLeaves error:&error];
