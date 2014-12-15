//
//  MapController.h
//  TerpsTrade
//
//  Created by Luka Zhupa on 12/4/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, copy) NSNumber *latitude;
@property (nonatomic, copy) NSNumber *longitude;

@end
