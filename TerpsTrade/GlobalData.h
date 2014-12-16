//
//  GlobalData.h
//  TerpsTrade
//
//  Created by Jonathan Tseng on 12/11/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlobalData : NSObject
{
  NSMutableArray *_bookTitles;
  NSMutableArray *_authors;
  NSMutableArray *_prices;
  NSMutableArray *_distances;
  NSMutableArray *_images;
  NSMutableArray *_latitudeCoordinates;
  NSMutableArray *_longitudeCoordinates;
  
  NSMutableArray *_englishBookTitles;
  NSMutableArray *_englishAuthors;
  NSMutableArray *_englishPrices;
  NSMutableArray *_englishDistances;
  NSMutableArray *_englishImages;
  
}


+ (GlobalData *)sharedInstance; //singleton


@property (strong, nonatomic) NSMutableArray *bookTitles; //of NSStrings
@property (strong, nonatomic) NSMutableArray *authors; //of NSStrings
@property (strong, nonatomic) NSMutableArray *prices; //of NSStrings
@property (strong, nonatomic) NSMutableArray *distances; //of NSStrings
@property (strong, nonatomic) NSMutableArray *images; //of NSStrings
@property (strong, nonatomic) NSMutableArray *latitudeCoordinates; //of NSStrings
@property (strong, nonatomic) NSMutableArray *longitudeCoordinates; //of NSStrings

@property (strong, nonatomic) NSMutableArray *englishBookTitles; //of NSStrings
@property (strong, nonatomic) NSMutableArray *englishAuthors; //of NSStrings
@property (strong, nonatomic) NSMutableArray *englishPrices; //of NSStrings
@property (strong, nonatomic) NSMutableArray *englishDistances; //of NSStrings
@property (strong, nonatomic) NSMutableArray *englishImages; //of NSStrings


@end
