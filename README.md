# react-native-sf-umshare

# 社会化分享

# 安装
> npm i react-native-sf-umshare

> 下载github上 SFShare并拽入IOS项目的target中(桥接文件)

# JS代码示例
```

import React, {Component} from 'react';
import {
    Platform,
    StyleSheet,
    Text,
    View
} from 'react-native';

const instructions = Platform.select({
    ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
    android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});
import {SFUmShareUI,SFUmShare} from 'react-native-sf-umshare'

type Props = {};
export default class App extends Component<Props> {
    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.welcome} onPress={() => {
                    var param1 = {
                        text: '我是谁1',
                        icon: 'http://kplan.oss-cn-shanghai.aliyuncs.com/header/2017-11-27_1511778896586',
                        url: 'http://kplan.oss-cn-shanghai.aliyuncs.com/header/2017-11-27_1511778896586',
                        title: '我在哪1',
                    }
                    this.ShareUI.share(param1,(result) =>{
                        console.log(result)
                    })
                    
                    
                    
                }}>
                    Welcome to React Native!
                </Text>
                <Text style={styles.instructions}>
                    To get started, edit App.js
                </Text>
                <Text style={styles.instructions}>
                    {instructions}
                </Text>
                <SFUmShareUI
                    ref={(ref) => this.share = ref}
                    platArray={['QQ', 'WechatSession', 'WechatTimeLine', 'WechatFavorite', 'Qzone', 'Facebook']}/>
            </View>
        );
    }

    clickItem = (i, isLast) => {
        if (isLast)
            alert('copy')
        else {
            var dic = {
                index: i,
                icon: 'http://kplan.oss-cn-shanghai.aliyuncs.com/header/2017-11-27_1511778896586',
                text: 'text',
                url: 'http://kplan.oss-cn-shanghai.aliyuncs.com/header/2017-11-27_1511778896586',
                title: 'title',
            }
            this.share.setParams(dic, (data) => {
                this.share.setVisiable(false)
            })
        }
    }

}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});


```

# IOS代码示例

```
/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

#import <UMCommon/UMCommon.h>
#import "UMShare.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"RNShare"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  [UMConfigure initWithAppkey:@"5ac479118f4a9d4acf0000f5" channel:@"App Store"];
  [self configUSharePlatforms];
  
  return YES;
}


- (void)configUSharePlatforms
{
  [UMShare setPlatforms:UMSocialPlatformType_WechatSession appKey:@"wx852d43a16b2af151" appSecret:@"423f56cbcdd97217a44352805cb1f410" redirectURL:@"http://mobile.umeng.com/social"];
  [UMShare setPlatforms:UMSocialPlatformType_QQ appKey:@"1104484470" appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
  [UMShare setPlatforms:UMSocialPlatformType_Sina appKey:@"1601664396" appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
  BOOL result = [UMShare setHandelURL:url sourceApplication:sourceApplication annotation:annotation];
  return result;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
  //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
  BOOL result = [UMShare setHandelURL:url options:options];
  return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
  BOOL result = [UMShare setHandelURL:url];

  return result;
}


@end


```

