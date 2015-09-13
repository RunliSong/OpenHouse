//
//  ViewController.m
//  OpenHouse
//
//  Created by RunliSong on 14-5-12.
//  Copyright (c) 2014年 Deakin. All rights reserved.
//
//Developer:
//1. Student Name: Peng Gao; Student No: 212409943.
//2. Student Name: Runli Song; Student No: 212535404.

#import "ViewController.h"
#import "BuildingListViewControler.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UINavigationItem *homeBar;
@property (strong, nonatomic) IBOutlet UIWebView *myWeb;

- (IBAction)overView:(id)sender;
- (IBAction)volunteer:(id)sender;
- (IBAction)program:(id)sender;
- (IBAction)mission:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *myImage;
- (IBAction)toBuildingList:(UIBarButtonItem *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    self.homeBar.title = @"Home";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)overView:(id)sender {
    NSString *htmlFile = [[NSBundle mainBundle]
                          pathForResource:@"Overview" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.myWeb loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
   
     _myImage.hidden = YES;

}

- (IBAction)volunteer:(id)sender {
    NSString *htmlFile = [[NSBundle mainBundle]
                          pathForResource:@"Volunteers" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.myWeb loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
    
     _myImage.hidden = YES;
}

- (IBAction)program:(id)sender {
    NSString *htmlFile = [[NSBundle mainBundle]
                          pathForResource:@"Program" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.myWeb loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
    
     _myImage.hidden = YES;
}

- (IBAction)mission:(id)sender {
    NSString *htmlFile = [[NSBundle mainBundle]
                          pathForResource:@"Mission" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.myWeb loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
    
     _myImage.hidden = YES;
}
- (IBAction)toBuildingList:(UIBarButtonItem *)sender {
    BuildingListViewControler *bvc = [[BuildingListViewControler alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
}
@end
