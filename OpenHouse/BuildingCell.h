//
//  BuildingCell.h
//  SIT206 Project 2
//
//  Created by Peng Gao on 16/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuildingCell : UITableViewCell
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *buildingName;
@property (strong, nonatomic) UILabel *buildingOpeningHourse;
@property (strong, nonatomic) UIImageView *accessoryImageView;

@end
