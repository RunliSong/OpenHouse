//
//  BuildingDetailViewController.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 20/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "BuildingDetailViewController.h"
#import "MapViewController.h"
//#import "BuildingWebsiteViewController.h"


@interface BuildingDetailViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation BuildingDetailViewController

- (instancetype)initWithBuilding:(Buildings *)building
{
    self = [super init];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        self.building = building;
        navItem.title = building.buildingOfficalName;
        ///NSLog(@"init");
    }
    return self;
}

- (instancetype)initWithBuildingWithName:(NSString *)buildingName
{
    self = [super init];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        Buildings *bs = [[Buildings alloc] init];
        Building *b = [Building new];
        NSArray *bArr = [bs getAllBuildings];
        for (int i = 0; i < bArr.count; i++) {
            if ([((Building *)[bArr objectAtIndex:i]).buildingOfficalName isEqualToString:buildingName]) {
                b = [bArr objectAtIndex:i];
            }
        }
        self.building = b;
        navItem.title = b.buildingOfficalName;
        ///NSLog(@"init");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //pic size: 310 w * 193 h
    [self updateUI];
//    UIButton *navigate = [UIButton buttonWithType:UIButtonTypeSystem];
//    [navigate addTarget:self action:@selector(naviToMap) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Navigate" style:UIBarButtonItemStylePlain target:self action:@selector(naviToMap)];
    self.navigationItem.rightBarButtonItem = barButton;
    //NSLog(@"didload");
}



- (void) updateUI
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    //set image
    UIImageView *buildingImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 310, 193)];
    buildingImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", self.building.buildingOfficalName]];
    [_scrollView addSubview:buildingImage];
    
    //set address label
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,buildingImage.frame.origin.y + buildingImage.frame.size.height + 10, 310, 24)];
    addressLabel = [self formatLabel:addressLabel withText:[NSString stringWithFormat:@"Address: %@", self.building.buildingAddress]];
    [_scrollView addSubview:addressLabel];
    
    
    //set opening hours label
    UILabel *openingHoursLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, addressLabel.frame.origin.y + addressLabel.frame.size.height + 10, 310, 15)];
    openingHoursLabel = [self formatLabel:openingHoursLabel withText:[NSString stringWithFormat:@"What's Open: %@", self.building.buildingOpeningHours]];
    [_scrollView addSubview:openingHoursLabel];
    
    //set What's open label
    UILabel *whatsOpenLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, openingHoursLabel.frame.origin.y + openingHoursLabel.frame.size.height + 10, 310, 15)];
     whatsOpenLabel = [self formatLabel:whatsOpenLabel withText:[NSString stringWithFormat:@"What's Open: %@", self.building.buildingOpenedAreas]];
    [_scrollView addSubview:whatsOpenLabel];
    
    
    //set Frequency of tours label
    UILabel *frequencyOfToursLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, whatsOpenLabel.frame.origin.y + whatsOpenLabel.frame.size.height + 10, 310, 15)];
    frequencyOfToursLabel = [self formatLabel:frequencyOfToursLabel withText:[NSString stringWithFormat:@"Frequency of tours: %@", self.building.buildingFrequencyOfTours]];
    [_scrollView addSubview:frequencyOfToursLabel];
    
    //Building type
    UILabel *buildingTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frequencyOfToursLabel.frame.origin.y + frequencyOfToursLabel.frame.size.height + 10, 310, 15)];
    buildingTypeLabel = [self formatLabel:buildingTypeLabel withText:[NSString stringWithFormat:@"Building Type: %@", self.building.buildingType]];
    [_scrollView addSubview:buildingTypeLabel];
    
    //Year built:
    UILabel *yearBuildLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, buildingTypeLabel.frame.origin.y + buildingTypeLabel.frame.size.height + 10, 310, 15)];
    yearBuildLabel = [self formatLabel:yearBuildLabel withText:[NSString stringWithFormat:@"Built Year: %@", self.building.buildingBuiltYear]];
    [_scrollView addSubview:yearBuildLabel];
    
    //Architect
    UILabel *architectLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, yearBuildLabel.frame.origin.y + yearBuildLabel.frame.size.height + 10, 310, 15)];
    architectLabel = [self formatLabel:architectLabel withText:[NSString stringWithFormat:@"Architect: %@", self.building.buildingArchitect]];
    [_scrollView addSubview:architectLabel];
    
    //website
    UILabel *websiteLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, architectLabel.frame.origin.y + architectLabel.frame.size.height + 10, 310, 15)];
    websiteLabel = [self formatLabel:websiteLabel withText:[NSString stringWithFormat:@"Website: %@", self.building.buildingWebsite]];
    [_scrollView addSubview:websiteLabel];
    
    //set Description
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, websiteLabel.frame.origin.y + websiteLabel.frame.size.height + 10, 310, 15)];
    descriptionLabel = [self formatLabel:descriptionLabel withText:self.building.buildingDescription];
    [_scrollView addSubview:descriptionLabel];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
//    button.frame = CGRectMake(5, descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + 10, 310, 15);
//    [button addTarget:self action:@selector(gotoWebPage) forControlEvents:UIControlEventTouchUpInside];
//    [_scrollView addSubview:button];
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + 10);
    [self.view addSubview:_scrollView];
    
    
}

- (void) naviToMap
{
    MapViewController *mapVC = [[MapViewController alloc] init];
    mapVC.building = self.building;
    [self.navigationController pushViewController:mapVC animated:YES];
}

//- (void) gotoWebPage
//{
//    BuildingWebsiteViewController *websiteVC = [[BuildingWebsiteViewController alloc] init];
//    websiteVC.webURL = self.building.buildingWebsite;
//    [self.navigationController pushViewController:websiteVC animated:YES];
//
//}

- (UILabel *)formatLabel: (UILabel *)paramLabel withText: (NSString *)textForLabel
{
    CGSize newSize;
    paramLabel.font = [UIFont systemFontOfSize:12];
    paramLabel.numberOfLines = 0;
    paramLabel.text = textForLabel;
    newSize = [self adjustHeightForLabel:paramLabel];
    paramLabel.frame = CGRectMake(paramLabel.frame.origin.x, paramLabel.frame.origin.y, paramLabel.frame.size.width, newSize.height);

    return paramLabel;
}


//adjust label's height according to how many lines of text
-(CGSize) adjustHeightForLabel:(UILabel *)paramaLabel
{
    CGSize maxSize = CGSizeMake(paramaLabel.frame.size.width, MAXFLOAT);
    
    CGRect labelRect = [paramaLabel.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:paramaLabel.font} context:nil];
    
    CGSize labelSize = CGSizeMake(labelRect.size.width, labelRect.size.height);
    
    return labelSize;
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

@end
