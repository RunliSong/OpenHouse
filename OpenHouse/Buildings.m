//
//  Buildings.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 20/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "Buildings.h"

@interface Buildings ()


@end

@implementation Buildings
{
    NSMutableArray *arr;
}

- (NSArray *)getAllBuildings
{
    arr = [[NSMutableArray alloc] init];
    
    TBXML *sourceXML = [[TBXML alloc] initWithXMLFile:@"testBuildingInformation.xml" error:nil];
    [self testTBXM:sourceXML];
    
    return [arr copy];
}

- (void)testTBXM:(TBXML *)tbx {
    TBXMLElement *root = tbx.rootXMLElement;
    if (root) {
        TBXMLElement *buildingElem = [TBXML childElementNamed:@"building" parentElement:root];
        while (buildingElem) {
            Buildings *b = [Buildings new];
            
            //element - name
            TBXMLElement *searchElement = [TBXML childElementNamed:@"name" parentElement:buildingElem];
            b.buildingOfficalName = [TBXML textForElement:searchElement];
            
            //element - address
            searchElement = [TBXML nextSiblingNamed:@"address" searchFromElement:searchElement];
            b.buildingAddress = [TBXML textForElement:searchElement];
            
            //element - openingHours
            searchElement = [TBXML nextSiblingNamed:@"openingHours" searchFromElement:searchElement];
            b.buildingOpeningHours = [TBXML textForElement:searchElement];
            
            //element - openArea
            searchElement = [TBXML nextSiblingNamed:@"openArea" searchFromElement:searchElement];
            b.buildingOpenedAreas = [TBXML textForElement:searchElement];
            
            //element - frequencyOfTours
            searchElement = [TBXML nextSiblingNamed:@"frequencyOfTours" searchFromElement:searchElement];
            b.buildingFrequencyOfTours = [TBXML textForElement:searchElement];
            
            //element - buildingType
            searchElement = [TBXML nextSiblingNamed:@"buildingType" searchFromElement:searchElement];
            b.buildingType = [TBXML textForElement:searchElement];
            
            //element - builtYear
            searchElement = [TBXML nextSiblingNamed:@"builtYear" searchFromElement:searchElement];
            b.buildingBuiltYear = [TBXML textForElement:searchElement];
            
            //element - architect
            searchElement = [TBXML nextSiblingNamed:@"architect" searchFromElement:searchElement];
            b.buildingArchitect = [TBXML textForElement:searchElement];
            
            //element - website
            searchElement = [TBXML nextSiblingNamed:@"website" searchFromElement:searchElement];
            b.buildingWebsite = [TBXML textForElement:searchElement];
            
            //element - description
            searchElement = [TBXML nextSiblingNamed:@"description" searchFromElement:searchElement];
            b.buildingDescription = [TBXML textForElement:searchElement];
            
            //element - buildingLocation
            searchElement = [TBXML nextSiblingNamed:@"buildingLocation" searchFromElement:searchElement];
            b.destinationLatitude = [[TBXML valueOfAttributeNamed:@"latitude" forElement:searchElement] floatValue];
            b.destinationLongitude = [[TBXML valueOfAttributeNamed:@"longitude" forElement:searchElement] floatValue];
            //sub element - latitude
            //sub element - longitude
            
            
            b.coordinate = CLLocationCoordinate2DMake(b.destinationLatitude, b.destinationLongitude);
            [arr addObject:b];
            
            buildingElem = [TBXML nextSiblingNamed:@"building" searchFromElement:buildingElem];
        }
    }
}

@end
