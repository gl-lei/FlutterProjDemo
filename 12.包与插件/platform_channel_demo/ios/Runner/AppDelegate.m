#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate()<FlutterStreamHandler>

@property (nonatomic, copy) FlutterEventSink eventSink;             ///< Event

@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    // 测试通道
    FlutterViewController *flutterVC = (FlutterViewController *)self.window.rootViewController;
    [self testBinaryMessageWithMessenger:flutterVC.binaryMessenger];
    [self testBasicMessageWithMessenger:flutterVC.binaryMessenger];
    [self testMethodChannelWithMessenger:flutterVC.binaryMessenger];
    [self testEventChannelWithMessenger:flutterVC.binaryMessenger];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

// 测试二进制消息
- (void)testBinaryMessageWithMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
    // 注册二进制消息回调操作
    __weak typeof(binaryMessenger) weakBinaryMessenger = binaryMessenger;
    [binaryMessenger setMessageHandlerOnChannel:@"foo" binaryMessageHandler:^(NSData * _Nullable message, FlutterBinaryReply  _Nonnull reply) {
        // 读取前8个字节的Float类型数据
        CGFloat x = 0;
        [message getBytes:&x range:NSMakeRange(0, 8)];
        
        // 读取后4个字节的的Int类型数据
        NSInteger y = 0;
        [message getBytes:&y range:NSMakeRange(8, 4)];
        
        NSLog(@"ios: x = %f, y = %zd", x, y);
        reply(nil);
        
        // 释放
        [weakBinaryMessenger setMessageHandlerOnChannel:@"foo" binaryMessageHandler:nil];
    }];
    
    // 发送二进制消息数据
    Float64 x1 = 3.1415926;
    int32_t y1 = 12345678;
    NSMutableData *messageData = [NSMutableData dataWithCapacity:12];
    [messageData appendData:[NSData dataWithBytes:&x1 length:sizeof(x1)]];
    [messageData appendData:[NSData dataWithBytes:&y1 length:sizeof(y1)]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [binaryMessenger sendOnChannel:@"foo" message:messageData];
    });
}

// 测试基础数据类型
- (void)testBasicMessageWithMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
    FlutterBasicMessageChannel *basicMessageChannel = [FlutterBasicMessageChannel messageChannelWithName:@"foo_1" binaryMessenger:binaryMessenger codec:FlutterStringCodec.sharedInstance];
    // 注册接收消息
    [basicMessageChannel setMessageHandler:^(id  _Nullable message, FlutterReply  _Nonnull callback) {
        NSLog(@"ios: %@", message);
        callback(@"Hi from iOS");
    }];
    
    // 发送消息
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [basicMessageChannel sendMessage:@"hello dart, this is ios." reply:^(id  _Nullable reply) {
            NSLog(@"ios: ios send message received reply: %@", reply);
        }];
    });
}

// 测试消息通道
- (void)testMethodChannelWithMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"foo_2" binaryMessenger:binaryMessenger];
    // 注册接收消息
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSLog(@"ios: received method channel with name: %@", call.method);
        if ([call.method isEqualToString:@"bar"]) {
            NSString *reply = [NSString stringWithFormat:@"Hello, %@", call.arguments];
            result(reply);
        } else if ([call.method isEqualToString:@"baz"]) {
            result([FlutterError errorWithCode:@"400" message:@"This is badi" details:nil]);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    // 发送消息
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *name = @"bar";
        NSString *value = @"world";
        [methodChannel invokeMethod:name arguments:value result:^(id  _Nullable result) {
            if ([result isKindOfClass:FlutterError.class]) {
                FlutterError *error = (FlutterError *)result;
                NSLog(@"%@ failed: %@", name, error.message);
            } else if ([FlutterMethodNotImplemented isEqual:result]) {
                NSLog(@"%@ not implemented", name);
            } else {
                NSLog(@"ios: %@", result);
            }
        }];
    });
}

- (void)testEventChannelWithMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"foo_3" binaryMessenger:binaryMessenger];
    [eventChannel setStreamHandler:self];
}

#pragma mark - NSNotification Methods Handler

- (void)onBatteryLevelDidChange:(NSNotification *)noti {
    [self sendBatteryLevelEvent];
}

#pragma mark - Private Methods

- (void)sendBatteryLevelEvent {
    if (self.eventSink == nil) return;
    int batteryLevel = [self getBatteryLevel];
    if (batteryLevel == -1) {
        self.eventSink([FlutterError errorWithCode:@"UNAVAILABLE" message:@"battery level is -1" details:nil]);
    } else {
        self.eventSink(@(batteryLevel));
    }
}

- (int)getBatteryLevel {
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    }
    return device.batteryLevel * 100;
}

#pragma mark - FlutterStreamHandler

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(FlutterEventSink)events {
    self.eventSink = events;
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBatteryLevelDidChange:) name:UIDeviceBatteryLevelDidChangeNotification object:nil];
    return nil;
}

- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [UIDevice currentDevice].batteryMonitoringEnabled = NO;
    self.eventSink = nil;
    return nil;
}

@end
