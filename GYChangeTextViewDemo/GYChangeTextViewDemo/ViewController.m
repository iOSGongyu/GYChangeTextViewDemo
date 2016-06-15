//
//  ViewController.m
//  GYChangeTextViewDemo
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 GY. All rights reserved.
//

#import "ViewController.h"
#import "GYChangeTextView.h"

@interface ViewController () <GYChangeTextViewDelegate>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) GYChangeTextView *tView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 200, 50, 20)];
    [button setTitle:@"stop" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    
    GYChangeTextView *tView = [[GYChangeTextView alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];
    tView.delegate = self;
    tView.layer.borderWidth = 1.0;  /*为了看的清楚加个边*/
    tView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:tView];
    self.tView = tView;
    [self.tView animationWithTexts:[NSArray arrayWithObjects:@"这是第1条",@"这是第2条",@"这是第3条", nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stop {
    [_tView stopAnimation];
}

- (void)gyChangeTextView:(GYChangeTextView *)textView didTapedAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}

@end
