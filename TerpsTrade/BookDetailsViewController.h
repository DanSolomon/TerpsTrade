//
//  BookDetailsViewController.h
//  TerpsTrade
//
//  Created by Jonathan Tseng on 11/24/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BookDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) CLLocation *location;

@end
