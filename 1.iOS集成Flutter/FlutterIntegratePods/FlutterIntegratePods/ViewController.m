//
//  ViewController.m
//  FlutterIntegratePods
//
//  Created by ggl on 2020/1/1.
//  Copyright © 2020 ggl. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)entryFlutterModule:(UIButton *)sender {
    FlutterEngine *flutterEngine = [(AppDelegate *)[UIApplication sharedApplication].delegate flutterEngine];
    FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self presentViewController:flutterVC animated:YES completion:nil];
}

@end
