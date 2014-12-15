//
//  MainViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 10/28/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "MainViewController.h"
#import "SearchResultsTableViewCell.h"
#import "BookDetailsViewController.h"
#import "MFSideMenu.h"

@interface MainViewController()

@end

@implementation MainViewController

int arrayCount = 0; // all array set to 0?

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.globalData = [GlobalData sharedInstance];
  self.title = @"Home";

  //Initialize navigation bar appearance
  [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:72.0/255.0 blue:71.0/255.0 alpha:1]];
  //[self.navigationController.navigationBar setTranslucent:NO];
  self.view.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1];
  self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
  
  
  [self.createListingButton setHidden:FALSE];
  [self.tableView setHidden:TRUE];
  [self.tableView setBackgroundColor:[UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1]];
  
  self.searchTextField.delegate = self;
  self.searchTextField.enabled = TRUE;
  
  //Initialize location manager
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.distanceFilter = kCLDistanceFilterNone;
  self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
  
  //Required for iOS 8- for CoreLocation framework
  if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
    [self.locationManager requestWhenInUseAuthorization];
  }
  [self.locationManager startUpdatingLocation];
  
  //Place magnifying glass icon on search text field and pad it
  [self.searchTextField setLeftViewMode:UITextFieldViewModeAlways];
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
  imageView.image = [UIImage imageNamed:@"magnifying_glass_icon.png"];
  UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
  [paddingView addSubview:imageView];
  [self.searchTextField setLeftView:paddingView];
  
  //Place barcode icon on search text field and pad it to give it some extra room
  [self.searchTextField setRightViewMode:UITextFieldViewModeAlways];
  UIImageView *imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
  imageViewTwo.image = [UIImage imageNamed:@"barcode.png"];
  UIView *paddingViewTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 20)];
  [paddingViewTwo addSubview:imageViewTwo];
  [self.searchTextField setRightView:paddingViewTwo];
  
  //Initially, have the home button not appear on the homescreen
  self.navigationItem.leftBarButtonItem = nil;
  
  
  //Reorders the books by distance from nearest to furthest
  [self reorderEntries];
  
  //Debugging statements
  /*double delayInSeconds = 5.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    NSLog(@"Current location: %@", [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude]);
  });*/
  
}

- (void)reorderEntries {
  NSMutableArray *distances = [[NSMutableArray alloc] init];
  for (int i = 0; i < [self.globalData.bookTitles count]; i++) {
    CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:[[self.globalData.latitudeCoordinates objectAtIndex:i] doubleValue]
                                                           longitude:[[self.globalData.longitudeCoordinates objectAtIndex:i] doubleValue]
                                 ];
    CLLocation *location = [self.locationManager location];
    CLLocation *endLocation = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude
                                                         longitude:location.coordinate.longitude];
    CLLocationDistance distance = [startLocation distanceFromLocation:endLocation]; //double
    [distances addObject:[[NSNumber alloc] initWithDouble:(distance * 0.00062137)]];
  }
  
  
  NSLog(@"Before: %@", distances);
  /*
   bookTitles
   authors
   prices
   distances
   images
   latitude_coordinates
   longtitude_coordinates
   */
  /*for (int a = 1; a < [distances count] - 1; a++) {
    int b = a;
    while (b > 0 && [distances objectAtIndex:(b-1)] > [distances objectAtIndex:b]) {
      [distances exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.bookTitles exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.authors exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.prices exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.distances exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.images exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.latitudeCoordinates exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      [self.globalData.longitudeCoordinates exchangeObjectAtIndex:b withObjectAtIndex:b-1];
      
      b = b - 1;
    }
    
  }*/

  NSLog(@"After: %@", distances);

  
  //cell.distanceAwayLabel.text = [NSString stringWithFormat:@"%.02lf mi",distance * 0.00062137];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)searchButton:(UIButton *)sender {
  [self.createListingButton setHidden:TRUE];
  [self.tableView setHidden:FALSE];
  self.title = @"Search";
  
  NSString *text = self.searchTextField.text;
  NSLog(@"Entered text is:%@",text);
  
  if( [text isEqualToString:@"math"] ){
    NSLog(@"Math entered");
    arrayCount = 1;
  }else if ( [text isEqualToString:@"english"]){
    NSLog(@"English entered");
    arrayCount = 2;
  }else{
    NSLog(@"entered else");
    arrayCount = 0; // set back to default array or all items ary.
  }
  
  //Have the home icon reappear again
  self.navigationItem.leftBarButtonItem = self.homeIcon;
  
  //Get rid of key board
  self.editing = false;

  [[self tableView] reloadData];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
  return UIStatusBarStyleLightContent;
}

#pragma mark - UITableView Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //return [self.bookTitles count];
  if (arrayCount == 2) {
    return [self.globalData.englishBookTitles count];
  } else {
    NSLog(@"# of books: %d", [self.globalData.bookTitles count]);
    return [self.globalData.bookTitles count];
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  SearchResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  
  if (!cell) {
    [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"BookCell" ];
    cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  }
  
  
  if(arrayCount == 2){
    cell.titleLabel.text = [self.globalData.englishBookTitles objectAtIndex:indexPath.row];
    cell.priceLabel.text = [self.globalData.englishPrices objectAtIndex:indexPath.row];
    cell.distanceAwayLabel.text = [self.globalData.englishDistances objectAtIndex:indexPath.row];
    cell.authorLabel.text = [self.globalData.englishAuthors objectAtIndex:indexPath.row];
    cell.bookThumbnail.image = [self.globalData.images objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1];
    
  } else {
    cell.titleLabel.text = [self.globalData.bookTitles objectAtIndex:indexPath.row];
    cell.priceLabel.text = [self.globalData.prices objectAtIndex:indexPath.row];
    cell.distanceAwayLabel.text = [self.globalData.distances objectAtIndex:indexPath.row];
    cell.authorLabel.text = [self.globalData.authors objectAtIndex:indexPath.row];
    cell.bookThumbnail.image = [self.globalData.images objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1];
    
    CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:[[self.globalData.latitudeCoordinates objectAtIndex:indexPath.row] doubleValue]
                                                           longitude:[[self.globalData.longitudeCoordinates objectAtIndex:indexPath.row] doubleValue]
                                 ];
    
    CLLocation *location = [self.locationManager location];
    CLLocation *endLocation = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude
                                                         longitude:location.coordinate.longitude];
    
    CLLocationDistance distance = [startLocation distanceFromLocation:endLocation]; // aka double
    cell.distanceAwayLabel.text = [NSString stringWithFormat:@"%.02lf mi",distance * 0.00062137];
  }

  
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - TextField Delegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
  
  NSLog(@"%@",textField.text);
}

#pragma mark - Side Menu
- (IBAction)showRightMenuPressed:(id)sender {
  [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}


//Go back to the home screen
- (IBAction)homeButtonPressed:(UIBarButtonItem *)sender {
  [self.tableView setHidden:TRUE];
  self.navigationItem.leftBarButtonItem = nil;
  [self.createListingButton setHidden: FALSE];
  self.searchTextField.text = nil;
  self.title = @"Home";
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if([[segue identifier] isEqualToString:@"ShowDetails"]) {
    BookDetailsViewController *bookDetailsViewController = segue.destinationViewController;
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    
    self.titleName = [self.globalData.bookTitles objectAtIndex:indexPath.row];
    self.author = [self.globalData.authors objectAtIndex:indexPath.row];
    self.price = [self.globalData.prices objectAtIndex:indexPath.row];
    self.imageName = [self.globalData.images objectAtIndex:indexPath.row];
    
    bookDetailsViewController.titleName = self.titleName;
    bookDetailsViewController.author = [NSString stringWithFormat:@"Author: %@", self.author];
    bookDetailsViewController.price = self.price;
    bookDetailsViewController.imageName = self.imageName;
    bookDetailsViewController.location = [[CLLocation alloc] initWithLatitude:[[self.globalData.latitudeCoordinates objectAtIndex:indexPath.row] doubleValue]
                                                                    longitude:[[self.globalData.longitudeCoordinates objectAtIndex:indexPath.row] doubleValue]
                                          ];
  }
}


@end
