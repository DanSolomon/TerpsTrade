//
//  SearchResultsTableViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 10/28/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "SearchResultsTableViewController.h"
#import "SearchResultsTableViewCell.h"

@interface SearchResultsTableViewController()

@property (strong, nonatomic) NSArray *bookTitles;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSArray *prices;
@property (strong, nonatomic) NSArray *distances;
@property (strong, nonatomic) NSArray *images;

@end

@implementation SearchResultsTableViewController

@synthesize bookTitles = _bookTitles;
@synthesize authors = _authors;
@synthesize prices = _prices;
@synthesize distances = _distances;
@synthesize images = _images;


- (NSArray *)bookTitles
{
  if (!_bookTitles) {
    _bookTitles = @[@"Calculus: An Intuitive and Physical Approach", @"Calculus For Dummies", @"The Calculus Lifesaver", @"Calculus", @"Calculus, 7th Edition"];
  }
  return _bookTitles;
}

- (NSArray *)authors
{
  if (!_authors) {
    _authors = @[@"Morris Kline", @"Mark Ryan", @"Adrian Bonner", @"Ron Larson and Bruce H. Edwards", @"James Stewart"];
  }
  return _authors;
}

- (NSArray *)prices
{
  if (!_prices) {
    _prices = @[@"$55", @"$20", @"$100", @"$233.33", @"$266.65"];
  }
  return _prices;
}

- (NSArray *)distances
{
  if (!_distances) {
    _distances = @[@"0.3 mi", @"0.6 mi", @"0.9 mi", @"1.1 mi", @"1.2 mi"];
  }
  return _distances;
}

- (void)viewDidLoad {
  [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
  [super viewDidLoad];
  self.navigationController.navigationBarHidden = NO;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.bookTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  SearchResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  
  if (!cell) {
    [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"BookCell" ];
    cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  }
  
  cell.titleLabel.text = [self.bookTitles objectAtIndex:indexPath.row];
  cell.priceLabel.text = [self.prices objectAtIndex:indexPath.row];
  cell.distanceAwayLabel.text = [self.distances objectAtIndex:indexPath.row];
  cell.authorLabel.text = [self.authors objectAtIndex:indexPath.row];
  
  return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}


@end
