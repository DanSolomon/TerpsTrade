//
//  BookDetailsViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 11/24/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "BookDetailsViewController.h"
#import "MapController.h"

@implementation BookDetailsViewController

-(void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationController.navigationBarHidden = NO;
  
  [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:72.0/255.0 blue:71.0/255.0 alpha:1]];
  //[self.navigationController.navigationBar setTranslucent:NO];
  self.view.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1];
  self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};

  
  [self.titleLabel setText:self.titleName]; //self.title
  [self.authorLabel setText:self.author];
  [self.priceLabel setText:self.price];
  [self.conditionLabel setText:@"Condition: Good"];
  [self.descriptionLabel setText:@"Description: Awesome book!"];
  [self setTitle: @"Details"];
  
  //Set thumbnail picture
  self.picture.image = self.imageName;
  
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if([[segue identifier] isEqualToString:@"mapSegue"]){
    MapController *mpc = segue.destinationViewController;
    NSNumber *latitude = [NSNumber numberWithDouble:self.location.coordinate.latitude];
    NSNumber *longitude = [NSNumber numberWithDouble:self.location.coordinate.longitude];
    mpc.latitude = latitude;
    mpc.longitude = longitude;
    
  } else { // Entered messageQueue
    
  }
  
}

@end
