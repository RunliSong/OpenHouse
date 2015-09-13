//
//  BuildingAnnotationMapViewController.m
//  OpenHouse
//
//  Created by Peng Gao on 26/05/2014.
//  Copyright (c) 2014 Deakin. All rights reserved.
//

#import "BuildingAnnotationMapViewController.h"
#import <MapKit/MapKit.h>
#import "Buildings.h"
#import "BuildingDetailViewController.h"
@class BuildingDetailViewController;

//@class Building;

@interface BuildingAnnotationMapViewController () <MKMapViewDelegate>
@property (nonatomic, strong) MKMapView *mapView;
@end

@implementation BuildingAnnotationMapViewController
{
   //static NSString *BUILDINGNAME;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"All buildings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Buildings *buildings = [[Buildings alloc] init];
    // Do any additional setup after loading the view.
    NSArray *buildingsArray = [buildings getAllBuildings];
    
    /* Create a map as big as our view */
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    
    /* Set the map type to Standard */
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    for (int i = 0; i < buildingsArray.count; i++) {
        /* Create the annotation using the location */
        Building *building = [buildingsArray objectAtIndex:i];
        //BuildingAnnotation *b = [[BuildingAnnotation alloc] initWithCoordinate:building.coordinate title:building.buildingOfficalName description:building.buildingOpeningHours];
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        
        [annotation setCoordinate:building.coordinate];
        [annotation setTitle:building.buildingOfficalName];
        [annotation setSubtitle:[NSString stringWithFormat:@"Opening hours: %@",building.buildingOpeningHours]];
        /* And eventually add it to the map */
        
        [self.mapView addAnnotation:annotation];
    }
    
    
    /* Add it to our view */
    [self.view addSubview:self.mapView];
    [self zoomToLocation];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    static NSString *annReuseId = @"currentloc";
    
    MKPinAnnotationView *annView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annReuseId];
    if (annView == nil)
    {
        annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annReuseId];
        
        annView.animatesDrop = YES;
        annView.canShowCallout = YES;
        
        UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annView.rightCalloutAccessoryView=detailButton;
    }
    else {
        annView.annotation = annotation;
    }
    
    return annView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSString *buildingTitle = [view.annotation title];
//    NSLog(@"%@", buildingTitle);
//    NSLog(@"calloutAccessoryControlTapped: annotation = %@", view.annotation);
//    BuildingDetailViewController *bVC = [[BuildingDetailViewController alloc] ];
//    //here, can set annotation info in some property of detailView
//    [[self navigationController] pushViewController:detailView animated:YES];
    BuildingDetailViewController *bvc = [[BuildingDetailViewController alloc] initWithBuildingWithName:buildingTitle ];
    [self.navigationController pushViewController:bvc animated:YES];
}

- (void) zoomToLocation
{
    //-38.131991, 144.358879‎

    //-38.132531, 144.356132‎
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(-38.132531, 144.356132);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 2500, 2500)];
    [self.mapView setRegion:adjustedRegion animated:YES];
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
