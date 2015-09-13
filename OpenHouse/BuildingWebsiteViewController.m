//
//  BuildingWebsiteViewController.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 21/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "BuildingWebsiteViewController.h"

@interface BuildingWebsiteViewController ()
@property (nonatomic, strong) UIWebView *myWebView;

@end

@implementation BuildingWebsiteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myWebView = [[UIWebView alloc]initWithFrame:self.view.frame];
    //self.myWebView.frame = self.view.frame;
    [self.view addSubview:self.myWebView];
    self.myWebView.scalesPageToFit = YES;
    
    // Do any additional setup after loading the view.
    
    //2
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.webURL]];
    
    //3
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.myWebView loadRequest:request];
    
    
//    //4
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    
//    //5
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//     {
//         if ([data length] > 0 && error == nil) [self.myWebView loadRequest:request];
//         else if (error != nil) NSLog(@"Error: %@", error);
//     }];
}


@end
