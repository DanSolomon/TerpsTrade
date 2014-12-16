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
  
  
  //Initialize location manager
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.distanceFilter = kCLDistanceFilterNone;
  self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
  
  //Required for iOS 8- for CoreLocation framework
  if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
    [self.locationManager requestWhenInUseAuthorization];
  }
  [self.locationManager startUpdatingLocation];
  
  self.title = @"New Post";
  
  
  //Place magnifying glass icon on search text field
  self.priceTextField.leftViewMode = UITextFieldViewModeAlways;
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 25, 25)];
  imageView.image = [UIImage imageNamed:@"dollar_sign.png"];
  self.priceTextField.leftView = imageView;
  }

  -(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
  }

  -(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%@",textField.text);
  }

//If camera isn't available, choose picture from camera roll
- (IBAction)setTextbookPostThumbnail:(UIButton *)sender {

  UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
  
  if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
  {
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
  }
  else
  {
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
  }
  
  [imagePicker setDelegate:self];
  [self presentModalViewController:imagePicker animated:YES];
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
  {
    self.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageButton setImage:self.image forState:UIControlStateNormal];
    [self dismissModalViewControllerAnimated:YES];
  }

  -(UIStatusBarStyle)preferredStatusBarStyle
  {
    return UIStatusBarStyleLightContent;
  }


- (IBAction)postTextbook:(UIButton *)sender {
  GlobalData *globalData = [GlobalData sharedInstance];
  [globalData.bookTitles addObject:self.titleTextField.text];
  [globalData.authors addObject:self.authorTextField.text];
  [globalData.prices addObject:self.priceTextField.text];
  [globalData.distances addObject:@"0.5 mi"];
  [globalData.images addObject:self.image];
  [globalData.latitudeCoordinates addObject:[NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude]];
  [globalData.longitudeCoordinates addObject:[NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude]];
  
  
  [self.locationManager stopUpdatingLocation];
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Textbook posted!"
                                                  message:@"Post successfully created"
                                                 delegate:nil
                                        cancelButtonTitle:@"Ok!"
                                        otherButtonTitles:nil];
  [alert show];
}

@end
