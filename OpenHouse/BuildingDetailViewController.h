//
//  BuildingDetailViewController.h
//  SIT206 Project 2
//
//  Created by Peng Gao on 20/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Buildings.h"

@interface BuildingDetailViewController : UIViewController
@property (nonatomic, strong) Building *building;

- (instancetype)initWithBuildingWithName:(NSString *)buildingName;
- (instancetype)initWithBuilding:(Building *)building;
@end
