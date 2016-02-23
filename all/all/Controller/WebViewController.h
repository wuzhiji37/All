//
//  WebViewController.h
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface WebViewController : BasicViewController <UIWebViewDelegate>
{
    NSString *_htmlString;
}
@property (nonatomic, strong) UIWebView *webView;
- (instancetype)initWithHTMLString:(NSString *)htmlString;
@end
