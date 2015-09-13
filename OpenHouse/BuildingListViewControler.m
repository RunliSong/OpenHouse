//
//  BuildingListViewControler.m
//  SIT206 Project 2
//
//  Created by Peng Gao on 16/05/2014.
//  Copyright (c) 2014 PengGao. All rights reserved.
//

#import "BuildingListViewControler.h"
#import "Buildings.h"
#import "BuildingDetailViewController.h"
#import "BuildingAnnotationMapViewController.h"

#define TOTAL_BUILDINGS 12

@interface BuildingListViewControler ()
@property (nonatomic, strong) Building *buildingForSegue;

@end

@implementation BuildingListViewControler
{
    NSArray *allBuildingsArray;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //adjust the top of tableview
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show in map" style:UIBarButtonItemStylePlain target:self action:@selector(showAllBuildingsInMap)];
    self.navigationItem.rightBarButtonItem = anotherButton;

    

    UIEdgeInsets inset = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];//the 'Separator' is the line between two cells
    
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
}

- (void)showAllBuildingsInMap
{
    BuildingAnnotationMapViewController * allBuildingsVC = [BuildingAnnotationMapViewController new];
    [self.navigationController pushViewController:allBuildingsVC animated:YES];
}

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    self.automaticallyAdjustsScrollViewInsets = YES;
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Buildings";
        allBuildingsArray = [NSArray new];
        Buildings *b = [Buildings new];
        allBuildingsArray = [b getAllBuildings];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allBuildingsArray count];
    //return TOTAL_BUILDINGS;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    BuildingCell *cell = [[BuildingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    Building *b = (Building *)allBuildingsArray[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_small", b.buildingOfficalName]];
    cell.buildingName.text = b.buildingOfficalName;
    cell.buildingOpeningHourse.text = [NSString stringWithFormat:@"Opening hours: %@", b.buildingOpeningHours] ;
    
    //set a static veraible to store current Building
    _buildingForSegue = b;
    return cell;
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    BuildingDetailViewController *buildingVC = [[BuildingDetailViewController alloc] initWithBuilding:[allBuildingsArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:buildingVC animated:YES];
}

//set TableViewCell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}



@end
