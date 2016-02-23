//
//  WebViewController.m
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (instancetype)initWithHTMLString:(NSString *)htmlString {
    self = [super init];
    if (self) {
        _htmlString = htmlString;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    self.webView = [[UIWebView alloc] init];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, 0, 0));
    }];
    self.webView.delegate = self;
//    self.webView.scalesPageToFit = YES;
    
    [self.webView loadHTMLString:_htmlString baseURL:nil];
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:webView animated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:webView animated:YES];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *requestURL = [request URL];
    if (([[requestURL scheme] isEqualToString: @"http"] || [[requestURL scheme] isEqualToString:@"https"] || [[requestURL scheme] isEqualToString: @"mailto" ])
        && (navigationType == UIWebViewNavigationTypeLinkClicked)) {
        return ![[UIApplication sharedApplication] openURL:requestURL];
    }
    return YES;
}
@end
