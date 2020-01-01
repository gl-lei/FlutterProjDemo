//
//  AppDelegate.h
//  FlutterIntegrateFramework
//
//  Created by ggl on 2020/1/1.
//  Copyright © 2020 ggl. All rights reserved.
//  手动导入framework，每次需要运行 flutter build ios-framework --output=some/path 命令

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>

@interface AppDelegate : FlutterAppDelegate <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) FlutterEngine *flutterEngine;     ///< Flutter引擎


@end

