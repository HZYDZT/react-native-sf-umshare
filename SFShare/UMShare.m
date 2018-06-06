//
//  UMShare.m
//  RNShare
//
//  Created by SmartFun on 2018/6/6.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "UMShare.h"

@implementation UMShare

+ (void)setPlatforms:(UMSocialPlatformType)platformType
              appKey:(NSString *)appKey
           appSecret:(NSString *)appSecret
         redirectURL:(NSString *)redirectURL
{
  [[UMSocialManager defaultManager] setPlaform:platformType appKey:appKey appSecret:appSecret redirectURL:redirectURL];
}

+ (BOOL)setHandelURL:(NSURL *)url
   sourceApplication:(NSString *)sourceApplication
          annotation:(id)annotation
{
  BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
  return result;
}

+ (BOOL)setHandelURL:(NSURL *)url
{
  BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
  return result;
}

+ (BOOL)setHandelURL:(NSURL *)url
             options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
  BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
  return result;
}

@end
