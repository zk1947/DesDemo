//
//  DESManage.h
//  DesDemo
//
//  Created by 赵凯 on 2017/8/30.
//  Copyright © 2017年 赵凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DESManage : NSObject

+(NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;
+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;
@end
