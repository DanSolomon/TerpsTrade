//
//  SearchResultsTableViewCell.h
//  TerpsTrade
//
//  Created by Jonathan Tseng on 11/20/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *bookThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceAwayLabel;


@end
