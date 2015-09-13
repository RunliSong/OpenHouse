//
//  CViewController.m
//  OpenHouse
//
//  Created by RunliSong on 14-5-14.
//  Copyright (c) 2014年 Deakin. All rights reserved.
//
//Developer:
//1. Student Name: Peng Gao; Student No: 212409943.
//2. Student Name: Runli Song; Student No: 212535404.

#import "CViewController.h"



@interface CViewController () <UIAlertViewDelegate>
- (IBAction)faceBook:(id)sender;
- (IBAction)twitter:(id)sender;
- (IBAction)pinterest:(id)sender;
- (IBAction)iconosquare:(id)sender;
- (IBAction)mail:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UIWebView *myWeb;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) MFMailComposeViewController *mail;
- (IBAction)goBack:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end

@implementation CViewController

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
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)faceBook:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/OpenHouseGeelong"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWeb loadRequest:request];
    _myWeb.scalesPageToFit = YES;
    _myImage.hidden = YES;
    _myLabel.hidden = YES;
}

- (IBAction)twitter:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://twitter.com/OpenHouseG_long"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWeb loadRequest:request];
    _myWeb.scalesPageToFit = YES;
    _myImage.hidden = YES;
    _myLabel.hidden = YES;
}

- (IBAction)pinterest:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://hwww.pinterest.com/ohgeelong/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWeb loadRequest:request];
    _myWeb.scalesPageToFit = YES;
    _myImage.hidden = YES;
    _myLabel.hidden = YES;
}

- (IBAction)iconosquare:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://iconosquare.com/tag/OHG2012"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWeb loadRequest:request];
    _myWeb.scalesPageToFit = YES;
    _myImage.hidden = YES;
    _myLabel.hidden = YES;
}

- (IBAction)mail:(id)sender {
    MFMailComposeViewController* mail = [[MFMailComposeViewController alloc]init];
    [mail setMailComposeDelegate:self];
    NSString *mailTitle = @"Contact Us";
    //NSString *mailBody = @"hehe";
    NSArray *toGeelong = [NSArray arrayWithObject:@"info@openhousegeelong.org.au" ];
    //info@openhousegeelong.org.au
    
    mail = [[MFMailComposeViewController alloc] init];
    
    mail.mailComposeDelegate = self;
    [mail setSubject:mailTitle];
   // [mail setMessageBody:mailBody isHTML:NO];
    [mail setToRecipients:toGeelong];
    
    [self presentViewController:mail animated:YES completion:NULL];
  

    //NSLog(@"%hhd", [MFMailComposeViewController canSendMail]);
    
//    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backTo)];
//    
//    [mail setNavigationBarHidden:YES animated:YES];
//    //mail.navigationBar = [[UINavigationBar alloc] initWithFrame:naviFrame];
//    mail.navigationItem.leftBarButtonItem = back;
//    mail.navigationItem.backBarButtonItem = back;
    //[mail setTabBarItem:back];
    //mail.navigationItem.leftBarButtonIteml = [self dismissViewControllerAnimated:YES completion:NULL];
    //[self dismissViewControllerAnimated:YES completion:NULL];
   
    //[self presentViewController:self Animated:YES completion:nil];
    
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
//    enum MFMailComposeResult {
//        MFMailComposeResultCancelled,
//        MFMailComposeResultSaved,
//        MFMailComposeResultSent,
//        MFMailComposeResultFailed
//    };
    if (result == MFMailComposeResultCancelled)
        [self dismissViewControllerAnimated:YES completion:NULL];
    if (result == MFMailComposeResultSaved)
        [self dismissViewControllerAnimated:YES completion:NULL];
    
    if (result == MFMailComposeResultSent)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message sent" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    if (result == MFMailComposeResultFailed)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    //

}
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)backTo
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    }

- (IBAction)goBack:(UIBarButtonItem *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    

}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    _myImage.hidden = NO;
    _myLabel.hidden = NO;
    _myWeb.hidden = YES;
}
@end
