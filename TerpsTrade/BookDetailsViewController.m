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
  [self.conditionLabel setText:@"Condition: Good"];
  [self.descriptionLabel setText:@"Description: Awesome book!"];
  [self setTitle: @"Details"];
  
  if ([self.imageName isEqualToString:@"calculus-7th-edition-64.jpg"]) {
    self.picture.image = [UIImage imageNamed:@"calculus-7th-edition-125.jpg"];
    NSLog(@"A");
  } else if ([self.imageName isEqualToString:@"calculus-64.jpg"]) {
    self.picture.image = [UIImage imageNamed:@"calculus-125.jpg"];
    NSLog(@"B");
  } else if ([self.imageName isEqualToString:@"calculus-for-dummies-64.jpg"]) {
    self.picture.image = [UIImage imageNamed:@"calculus-for-dummies-125.jpg"];
    NSLog(@"C");
  } else if ([self.imageName isEqualToString:@"calculus-intuitive-64.jpg"]) {
    self.picture.image = [UIImage imageNamed:@"calculus-intuitive-125.jpg"];
    NSLog(@"D");
  } else if ([self.imageName isEqualToString:@"calculus-lifesaver-64.png"]) {
    self.picture.image = [UIImage imageNamed:@"calculus-lifesaver-125.png"];
    NSLog(@"E");
  }
  
}

@end
