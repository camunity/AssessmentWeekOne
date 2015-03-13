//
//  WebViewController.m
//  AssessmentWeekOne
//
//  Created by Cameron Flowers on 3/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self; //IMPORTANT STEP 
    NSString *homepage = @"http://www.mobilemakers.co";
    [self goToURLString:homepage];
}

- (void)goToURLString:(NSString *)string {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    //url request with our string
    [self.webView loadRequest:request]; //have our webview load the request
}


-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.spinner stopAnimating];
}



@end
