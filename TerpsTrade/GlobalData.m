//
//  GlobalData.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 12/11/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData


//Init singleton
+ (GlobalData *)sharedInstance {
  static dispatch_once_t onceToken;
  static GlobalData *instance = nil;
  dispatch_once(&onceToken, ^{
    instance = [[GlobalData alloc] init];
  });
  return instance;
}

- (id)init {
  self = [super init];
  if (self) {
    _bookTitles = [[NSMutableArray alloc] initWithObjects:@"Calculus: An Intuitive and Physical Approach", @"The Calculus Lifesaver", @"Calculus", @"Calculus, 7th Edition", @"Calculus For Dummies", nil];
    _authors = [[NSMutableArray alloc] initWithObjects:@"Morris Kline", @"Adrian Bonner", @"Ron Larson and Bruce H. Edwards", @"James Stewart",  @"Mark Ryan", nil];
    _prices = [[NSMutableArray alloc] initWithObjects:@"$55", @"$100", @"$233.33", @"$266.65", @"$20", nil];
    _distances = [[NSMutableArray alloc] initWithObjects:@"0.3 mi",  @"0.9 mi", @"1.1 mi", @"1.2 mi", @"0.6 mi", nil];
    _images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"calculus-intuitive-64.jpg"], [UIImage imageNamed:@"calculus-lifesaver-64.png"], [UIImage imageNamed:@"calculus-64.jpg"], [UIImage imageNamed:@"calculus-7th-edition-64.jpg"], [UIImage imageNamed:@"calculus-for-dummies-64.jpg"], nil];
    _latitudeCoordinates = [[NSMutableArray alloc] initWithObjects:@"38.981508", @"38.982021", @"38.992963", @"38.991833", @"39.002706", nil];
    _longitudeCoordinates = [[NSMutableArray alloc] initWithObjects:@"-76.944635", @"-76.943219", @"-76.950318", @"-76.946646", @"-76.942432", nil];
    
    
    
    _englishBookTitles = [[NSMutableArray alloc] initWithObjects:@"English101: Literature", @"English for Dummies", @"English: We Speak gewd yes.", @"English: The Untold Stories", @"English.", nil];
    
    _englishAuthors = [[NSMutableArray alloc] initWithObjects:@"Jonathon Park", @"Jacob Streutt", @"William Blen", @"Horace Boragio, Jackson Scott", @"Patrick J. Poelst", nil];
    
    _englishPrices = [[NSMutableArray alloc] initWithObjects:@"$35", @"$10", @"$130", @"$453.33", @"$365.33", nil];
    
    _englishDistances = [[NSMutableArray alloc] initWithObjects:@"0.4 mi", @"1.6 mi", @"0.4 mi", @"1.0 mi", @".1 mi", nil];
    
    
  }
  return self;
}


@end
