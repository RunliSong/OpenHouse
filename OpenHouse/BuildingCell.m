//
//  BuildingCell.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 16/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "BuildingCell.h"

@implementation BuildingCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0.0, 0.0, 320.0, 50.0);
        //self.backgroundColor = [UIColor blackColor];
        self.iconImageView = [UIImageView new];
        self.iconImageView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + 5.0, 88, 40);
        
        self.buildingName = [UILabel new];
        //Rect(88,0,192,30)
        self.buildingName.frame = CGRectMake(self.frame.origin.x + self.iconImageView.bounds.size.width, self.frame.origin.y, self.frame.size.width - self.iconImageView.bounds.size.width - 40, 30.0);
        
        self.buildingOpeningHourse = [UILabel new];
        self.buildingOpeningHourse.frame = CGRectMake(self.buildingName.frame.origin.x, self.frame.origin.y+self.buildingName.bounds.size.height, self.buildingName.bounds.size.width, 12.0);
        
        //set label's font size
        self.buildingOpeningHourse.font = [UIFont systemFontOfSize:10];

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cannot adjust accessoryView's frame
        //self.accessoryView.frame = CGRectMake(self.frame.origin.x+280.0, self.frame.origin.y , 40.0, 40.0);

        [self addSubview:self.iconImageView];
        [self addSubview:self.buildingName];
        [self addSubview:self.buildingOpeningHourse];
        //[self addSubview:self.accessoryImageView];
    }
    return self;
}
@end
