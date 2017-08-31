//
//  DESManage.m
//  DesDemo
//
//  Created by 赵凯 on 2017/8/30.
//  Copyright © 2017年 赵凯. All rights reserved.
//

#import "DESManage.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@implementation DESManage

const Byte iv[] = {1,2,3,4,5,6,7,8};
+(NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    NSString *ciphertext = nil;
    
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes], dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [GTMBase64 stringByEncodingData:data];
    }
    return ciphertext;
}

+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key
{
    NSString *plaintext = nil;
    NSData *cipherdata = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [cipherdata bytes], [cipherdata length],
                                          buffer, 1024,
                                          &numBytesDecrypted);
    if(cryptStatus == kCCSuccess) {
        NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plaintext = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
    return plaintext;
}

@end
