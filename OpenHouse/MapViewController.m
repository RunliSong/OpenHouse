//
//  MapViewController.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 17/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "MapViewController.h"
#import "Buildings.h"

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface MapViewController ()
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *myLocationManager;
@property (nonatomic) CLLocationCoordinate2D destinationBuildingLocation;
@end

@implementation MapViewController
{
    CLLocationManager *locationManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}


- (BOOL) shouldAutorotate
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.showsUserLocation = YES;
    
    [self.view addSubview:self.mapView];
//    CLLocationCoordinate2D destinationLocation;
//    destinationLocation.latitude = self.building.destinationLatitude;
//    destinationLocation.longitude = self.building.destinationLongitude;
//    
//    MKPlacemark* placemark = [[MKPlacemark alloc] initWithCoordinate:destinationLocation addressDictionary:nil];
//    
//    MKMapItem* item = [[MKMapItem alloc] initWithPlacemark:placemark];
//
//    [item openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];
    
    CLLocationCoordinate2D startCoor = self.mapView.userLocation.location.coordinate;
    CLLocationCoordinate2D endCoor = self.building.coordinate;
    
    if (SYSTEM_VERSION_LESS_THAN(@"6.0")){ // ios6以下，调用google map
        
        NSString *urlString = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f&dirfl=d",startCoor.latitude,startCoor.longitude,endCoor.latitude,endCoor.longitude];
        //        @"http://maps.apple.com/?saddr=%f,%f&daddr=%f,%f",startCoor.latitude,startCoor.longitude,endCoor.latitude,endCoor.longitude
        urlString =  [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *aURL = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:aURL];
    } else { // 直接调用ios自己带的apple map
        
        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:endCoor addressDictionary:nil]];
        toLocation.name = @"to name";
        
        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                       launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
        
    }

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
