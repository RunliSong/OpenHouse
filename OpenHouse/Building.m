//
//  Building.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 14/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "Building.h"
#import "Buildings.h"

@interface Building()

@end
@implementation Building

- (instancetype)initWithBuildingName:(NSString *)buildingName
{
    self = [super init];
    if (self) {
        Buildings *buildings = [Buildings new];
        NSArray *allBuildingList = [buildings getAllBuildings];
        for (int i=0; i < [allBuildingList count]; i++) {
            if ([self.buildingOfficalName isEqualToString: ((Building *)allBuildingList[i]).buildingOfficalName]) {
                self = (Building *)allBuildingList[i];
            }
        }
    }
    return self;
}


- (NSString *)description
{
    NSMutableString *des = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@ information\n", _buildingOfficalName]];
    [des appendString:[NSString stringWithFormat:@"Address: %@\n", _buildingAddress]];
    [des appendString:[NSString stringWithFormat:@"Opening hours: %@\n", _buildingOpeningHours]];
    [des appendString:[NSString stringWithFormat:@"What's open: %@\n", _buildingOpenedAreas]];
    [des appendString:[NSString stringWithFormat:@"Frequency of tours: %@\n", _buildingFrequencyOfTours]];
    [des appendString:[NSString stringWithFormat:@"Building type: %@\n", _buildingType]];
    [des appendString:[NSString stringWithFormat:@"Year built: %@\n", _buildingBuiltYear]];
    [des appendString:[NSString stringWithFormat:@"Architect: %@\n", _buildingArchitect]];
    [des appendString:[NSString stringWithFormat:@"Website: %@\n", _buildingWebsite]];
    [des appendString:[NSString stringWithFormat:@"Description: %@\n", _buildingDescription]];
    [des appendString:[NSString stringWithFormat:@"Latitude: %f\n", _destinationLatitude]];
    [des appendString:[NSString stringWithFormat:@"Longitude: %f\n", _destinationLongitude]];
    return des;
}

+ (instancetype)getBuildingDetailByName:(NSString *)buildingName
{
    static Building *building = nil;
    
    if (!building) {
        building = [[self alloc] initWithBuildingName:buildingName];
    } else
    {
        building = nil;
        building = [[self alloc] initWithBuildingName:buildingName];
    }
    
    return building;
}

@end
