//
//  SM4EncodeAndDecode.m
//  officialDemo2D
//
//  Created by yfc on 16/6/15.
//  Copyright © 2016年 AutoNavi. All rights reserved.
//

#import "SM4EncodeAndDecode.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SM4EncodeAndDecode

+ (NSString *)decodeJieMi:(NSString *)base64Str AndKeyStr:(NSString *)keyStr {

    char plainTextCharaa[16];
    ///////将秘钥字符串转化成char数组
//    NSString *str = @"f69d2c6a4b0b2839c71f90c1d7b2c5e0";
    
    NSString *str = keyStr;
//    NSLog(@"strstr:%@",str);
    
    for (int i = 0; i < 16; i ++) {
        NSString *twoStr = [str substringToIndex:2];
        NSRange r = {0,2};
        str = [str stringByReplacingCharactersInRange:r withString:@""];
//        NSLog(@"twoStr:%@",twoStr);
        const char *aa = [twoStr cStringUsingEncoding:NSUTF8StringEncoding];
        int nValue = 0;
        sscanf(aa,"%x", &nValue);
//        printf("aax:%x\r\n",nValue);
//        printf("aad:%d\r\n",nValue);
        NSString *tenStr = [NSString stringWithFormat:@"%d",nValue];
//        NSLog(@"tenStr:%@",tenStr);
        int count = [tenStr intValue];
        plainTextCharaa[i] = count;
//        NSLog(@"plainTextCharaa[i]plainTextCharaa[i]:%d",plainTextCharaa[i]);
    }
    
//    printf("plainTextChar:%s ", plainTextCharaa);
    
    
//    yutestjiami(plainTextDataLength + p, plainTextChar, cipherTextChar, plainTextCharaa);
//    
//    NSData *cipherTextData =  [[NSData alloc]initWithBytes:cipherTextChar length:sizeof(cipherTextChar)];
//    NSLog(@"cipherTextData：%@",cipherTextData);
//    NSString *base64Str = [[NSString alloc]initWithData:[Base64 encodeData:cipherTextData] encoding:NSUTF8StringEncoding];
//    NSLog(@"base64之后的密文：%@",[[NSString alloc]initWithData:[Base64 encodeData:cipherTextData] encoding:NSUTF8StringEncoding]);
    //        NSString *string = @"Cu78ukLlKXSrZk/CFJpGGw==";
    /////////////=====
    
    //1将传进来的base64字符串转成data类型

    NSData *cipherTextDataaa = [[NSData alloc]
                                      initWithBase64EncodedString:base64Str options:0];
//    NSData *cipherTextDataaa = [Base64 decodeString:base64Str];
    //    NSString *decodeStr = [[NSString alloc]initWithData:cipherTextData encoding:NSUTF8StringEncoding];
    //2将data拷贝到字符数组中
    unsigned char cipherTextCharaa[cipherTextDataaa.length];
    memcpy(cipherTextCharaa, cipherTextDataaa.bytes, cipherTextDataaa.length);
    
    
    //3调用解密函数得到cipherToPlainChar
    unsigned char cipherToPlainChar[cipherTextDataaa.length];
    //YHXG6.20
    //    yutestjiemi(cipherTextDataaa.length, cipherTextCharaa, cipherToPlainChar);
    
    yutestjiemi(cipherTextDataaa.length, cipherTextCharaa, cipherToPlainChar, plainTextCharaa);
  
    //4计算填充后的密文长度（和明文长度一样）!!!!这个步骤要在解密后
    int p2 = cipherToPlainChar[sizeof(cipherToPlainChar) - 1];
    int cipherToPlainLengthWithoutPadding = cipherTextDataaa.length-p2;
//    NSLog(@"cipherToPlainLengthWithoutPadding:%d",cipherToPlainLengthWithoutPadding);
//    NSLog(@"p2=%d",p2 );
    
    //5去掉填充的字符 变成cipherToPlainCharWithoutPadding
    unsigned char cipherToPlainCharWithoutPadding[cipherToPlainLengthWithoutPadding];
    memcpy(cipherToPlainCharWithoutPadding, cipherToPlainChar, cipherToPlainLengthWithoutPadding);
    
    
    //6将16进制的cipherToPlainCharWithoutPadding转成16进制的str
    NSMutableString *cipherToPlainStrHex = [NSMutableString string];
    for (int i=0; i<cipherToPlainLengthWithoutPadding; i++)
    {
        [cipherToPlainStrHex appendFormat:@"%02x", cipherToPlainCharWithoutPadding[i]];
    }
    //    NSLog(@"------ %@",cipherToPlainStrHex);
    
    //7将16进制的str转成10进制str
//    NSLog(@"[self stringFromHexString:cipherToPlainStrHex]:%@",[self stringFromHexString:cipherToPlainStrHex]);
    
    return [self stringFromHexString:cipherToPlainStrHex];
}

// 十六进制转换为普通字符串的。
+ (NSString *)stringFromHexString:(NSString *)hexString { //
    if ([hexString isEqualToString:@""] || hexString == nil) {
//        NSLog(@"%s--%@", __func__, @"明文为空或解密失败");
        return @"";//明文为空或解密失败
    }
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [ [NSScanner alloc] initWithString:hexCharStr]   ;
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    
//    NSLog(@"------解密后的字符串=======%@",unicodeString);
    return unicodeString;
}

+ (NSData *)dataFromHexString:(NSString*)hexString {
    NSString * cleanString = [SM4EncodeAndDecode cleanNonHexCharsFromHexString:hexString];
    if (cleanString == nil) {
        return nil;
    }
    
    NSMutableData *result = [[NSMutableData alloc] init];
    
    int i = 0;
    for (i = 0; i+2 <= cleanString.length; i+=2) {
        NSRange range = NSMakeRange(i, 2);
        NSString* hexStr = [cleanString substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        unsigned char uc = (unsigned char) intValue;
        [result appendBytes:&uc length:1];
    }
    NSData * data = [NSData dataWithData:result];
    //    [result release];
    return data;
}

+ (NSString *)cleanNonHexCharsFromHexString:(NSString *)input {
    if (input == nil) {
        return nil;
    }
    
    NSString * output = [input stringByReplacingOccurrencesOfString:@"0x" withString:@""
                                                            options:NSCaseInsensitiveSearch range:NSMakeRange(0, input.length)];
    NSCharacterSet *hexc = [NSCharacterSet characterSetWithCharactersInString:input];
    NSCharacterSet *invalidHexc = [hexc invertedSet];
    NSString * allHex = [[output componentsSeparatedByCharactersInSet:invalidHexc] componentsJoinedByString:@""];
    return allHex;
}


@end
