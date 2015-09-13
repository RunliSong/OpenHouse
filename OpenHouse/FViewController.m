//
//  FViewController.m
//  OpenHouse
//
//  Created by RunliSong on 14-5-14.
//  Copyright (c) 2014年 Deakin. All rights reserved.
//
//Developer:
//1. Student Name: Peng Gao; Student No: 212409943.
//2. Student Name: Runli Song; Student No: 212535404.

#import "FViewController.h"

@interface FViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *myWeb;
- (IBAction)refreshWeb:(id)sender;
- (IBAction)goBack:(UIBarButtonItem *)sender;

@end

@implementation FViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSURL *url = [NSURL URLWithString:@"http://www.surveymonkey.com/s/YK7XBWJ"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWeb loadRequest:request];
    _myWeb.scalesPageToFit = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)refreshWeb:(id)sender {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.surveymonkey.com/s/YK7XBWJ"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWeb loadRequest:request];
    _myWeb.scalesPageToFit = YES;

}

- (IBAction)goBack:(UIBarButtonItem *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    

}
@end
