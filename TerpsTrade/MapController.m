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



-(void)setLongitude: (double)inVal{
    longitude = inVal;
}

-(void)setLatitude: (double)inVal{
    latitude = inVal;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void) viewDidAppear:(BOOL)animated{
    
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(longitude, latitude);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, MAPSIZE, MAPSIZE)];
    

    [_mapView setRegion:adjustedRegion animated:YES];
    
    
}
@end
