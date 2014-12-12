//
//  NewPostingViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 12/11/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "NewPostingViewController.h"
#import "GlobalData.h"

@implementation NewPostingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)setTextbookPostThumbnail:(UIButton *)sender {
  GlobalData *globalData = [GlobalData sharedInstance];
  [globalData.bookTitles addObject:self.titleTextField.text];
  [globalData.authors addObject:self.authorTextField.text];
  [globalData.prices addObject:self.priceTextField.text];
  [globalData.distances addObject:@"0.5 mi"];
  [globalData.images addObject:@"calculus-64.jpg"];
  [globalData.latitudeCoordinates addObject:@"38.981508"];
  [globalData.longitudeCoordinates addObject:@"-76.944635"];
  
}

@end
