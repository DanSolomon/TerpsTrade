//
//  MapController.m
//  TerpsTrade
//
//  Created by Luka Zhupa on 12/4/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "MapController.h"



@implementation MapController
    //creates global variables
    double longitude;
    double latitude;
    //creating global variables if above variable were in {}
   static const double MAPSIZE = 200;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}


-(void) viewDidAppear:(BOOL)animated{
    
    //CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(longitude, latitude);
////    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, MAPSIZE, MAPSIZE)];
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = startCoord;
//     [_mapView addAnnotation:point];
//    
//    [_mapView setRegion:adjustedRegion animated:YES];
  
  double myLatitude = [_latitude doubleValue];
  double myLongitude = [_longitude doubleValue];
  MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(myLatitude, myLongitude), MAPSIZE, MAPSIZE)];
 
   MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
   point.coordinate = CLLocationCoordinate2DMake(myLatitude, myLongitude);
   [_mapView addAnnotation:point];
   [_mapView setRegion:adjustedRegion animated:YES];
    
}
@end
