//
//  padding.h
//  SM4444Demo
//
//  Created by 王涛 on 3/27/16.
//  Copyright © 2016 王涛. All rights reserved.
//

#ifndef padding_h
#define padding_h

#include <stdio.h>

/**
 *  @author TTwong, 16-03-30 23:03:27
 *
 *  对要加密的字符串进行补足字节
 *
 *  @param input        要加密的字符串
 *  @param stringLength 输入参数：要加密的字符串的长度
 */
void paddingForEncryption(unsigned char **input, unsigned long stringLength);


/**
 *  @author TTwong, 16-03-30 23:03:05
 *
 *  补足字节的反操作
 *
 *  @param input        要解密的字符串
 *  @param stringLength 输出参数：字符串的实际长度
 */
void unpaddingForDecryption(unsigned char **input, unsigned long *stringLength);

#endif /* padding_h */
