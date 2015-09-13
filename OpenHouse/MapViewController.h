//
//  MapViewController.h
//  SIT206 Project 2
//
//  Created by Peng Gao on 17/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class Building;

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (nonatomic, strong) Building *building;
@end
