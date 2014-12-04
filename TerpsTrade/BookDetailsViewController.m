//
//  BookDetailsViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 11/24/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "BookDetailsViewController.h"

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

@end
