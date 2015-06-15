//
//  ViewController.m
//  webViewDemo
//
//  Created by YangTingting on 15-6-9.
//  Copyright (c) 2015年 YangTingting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
UIActivityIndicatorView *activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url=[NSURL URLWithString:@"http://192.168.2.160"];
//    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    int width=[UIScreen mainScreen].bounds.size.width;
    int height=[UIScreen mainScreen].bounds.size.height;
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 50,width, height-30)];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.view addSubview:webView];
    [webView loadRequest:request];
    [webView setDelegate:self];
}
-(void)mButton:(UIButton*)sender{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    
    NSLog(@"webViewDidStartLoad");
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,0,
    width, height)];
    [view setTag:108];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 128.0f, 128.0f)];
    [activityIndicator setCenter:view.center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [view addSubview:activityIndicator];
    [activityIndicator startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activityIndicator stopAnimating];
    UIView *view=(UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    NSLog(@"webViewDidFinishLoad");
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [activityIndicator stopAnimating];
    UIView *view=(UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    NSLog(@"webViewDidFailLoadWithError:%@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
