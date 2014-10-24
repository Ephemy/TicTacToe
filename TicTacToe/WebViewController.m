//
//  WebViewController.m
//  TicTacToe
//
//  Created by Jonathan Chou on 10/24/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tic-tac-toe"]]];
}



@end
