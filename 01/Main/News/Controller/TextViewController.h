//
//  TextViewController.h
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseViewController.h"

@interface TextViewController : BaseViewController<UIWebViewDelegate>
{
    UIWebView *_webView ;
    UIActivityIndicatorView *_activityView;
}
@end
