//
//  ViewController.m
//  HLBView
//
//  Created by 郝一鹏 on 16/6/22.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "ViewController.h"
#import "HILView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HILView *view = [[HILView alloc] initWithFrame:CGRectMake(100, 100, 100, 120) fontSize:16];
    [view setTitle:@"这是一个测试" titleColor:0x999999];
    [view setImage:@"mm.jpg"];
    [view addTarget:self action:@selector(todo)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)todo {;
    NSLog(@"1111111111111111");
}

@end
