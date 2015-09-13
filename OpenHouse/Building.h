//
//  Building.h
//  SIT206 Project 2
//
//  Created by Peng Gao on 14/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Building : NSObject

@property (nonatomic, strong) NSString *buildingOfficalName;      //Building's name
@property (nonatomic, strong) NSString *buildingAddress;          //Address
@property (nonatomic, strong) NSString *buildingOpeningHours;     //Opening Hours
@property (nonatomic, strong) NSString *buildingOpenedAreas;      //What's Open
@property (nonatomic, strong) NSString *buildingBuiltYear;        //Frequency of tours
@property (nonatomic, strong) NSString *buildingArchitect;        //Architect of this building
@property (nonatomic, strong) NSString *buildingWebsite;          //Building's website *can be nil
@property (nonatomic, strong) NSString *buildingDescription;      //Building's detail
@property (nonatomic, strong) NSString *buildingFrequencyOfTours; //Frequency of tours
@property (nonatomic, strong) NSString *buildingType;             //Building's type

@property (nonatomic) float destinationLongitude;                         //Building's longitude
@property (nonatomic) float destinationLatitude;                          //Building's latitude
@property (nonatomic) CLLocationCoordinate2D coordinate;                 //Building's location, include longitude and latitude

@end
