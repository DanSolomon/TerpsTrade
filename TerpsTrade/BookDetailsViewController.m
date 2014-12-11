//
//  BookDetailsViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 11/24/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//


#import "DemoMessagesViewController.h"
#import "BookDetailsViewController.h"
#import "MapController.h"

@implementation BookDetailsViewController

-(void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationController.navigationBarHidden = NO;
  [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
  [self.titleLabel setText:self.title];
  [self.authorLabel setText:self.author];
  [self.priceLabel setText:self.price];

}



- (IBAction)mapButtonPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"mapSegue" sender:sender];
}

- (IBAction)messageButtonPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"messageSeque" sender:sender];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([[segue identifier] isEqualToString:@"mapSegue"]){
        MapController *mpc = segue.destinationViewController;
        
        [mpc setLongitude: 40.7903];
        [mpc setLatitude: 73.9597];
    
    }else{//message segue
        NSLog(@"messageSegue");
        DemoMessagesViewController *mvc = segue.destinationViewController;
        
    }
}

@end
