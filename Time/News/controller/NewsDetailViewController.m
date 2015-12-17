//
//  DetailViewController.m
//  Time
//
//  Created by imac on 15/8/11.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
{
    UIWebView *_web; //是用来显示网页的
}
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_web];
    
    /*
    //通过网址来加载webview
    //将百度网址显示到webView上去
    //创建一个网络请求
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    //使用这个网页请求，来加载web页面
    [_web loadRequest:request];
    */
    //通过html文件来加载webView
    //读取news.html
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    //将文件内容转化为字符串
    NSString *string=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //[_web loadHTMLString:string baseURL:nil];
    
    //webView内容自适应
    _web.scalesPageToFit=YES;
    
    //
    filePath=[[NSBundle mainBundle]pathForResource:@"news_detail" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    //
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    //
    NSString *title=dic[@"title"];
    NSString *content=dic[@"content"];
    
    NSString *source=dic[@"source"];
    NSString *time=dic[@"time"];
    
    //将这些内容拼接成完整地HTMlString
    NSString *htmlString=[NSString stringWithFormat:string,title,content,source,time];
    //
    [_web loadHTMLString:htmlString baseURL:nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
