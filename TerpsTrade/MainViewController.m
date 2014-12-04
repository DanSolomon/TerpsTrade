//
//  MainViewController.m
//  TerpsTrade
//
//  Created by Jonathan Tseng on 10/28/14.
//  Copyright (c) 2014 JonkGames. All rights reserved.
//

#import "MainViewController.h"
#import "SearchResultsTableViewCell.h"

@interface MainViewController()


@property (strong, nonatomic) NSArray *bookTitles;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSArray *prices;
@property (strong, nonatomic) NSArray *distances;
@property (strong, nonatomic) NSArray *images;

@property (strong, nonatomic) NSArray *englishBookTitles;
@property (strong, nonatomic) NSArray *englishAuthors;
@property (strong, nonatomic) NSArray *englishPrices;
@property (strong, nonatomic) NSArray *englishDistances;
@property (strong, nonatomic) NSArray *englishImages;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end


@implementation MainViewController

@synthesize bookTitles = _bookTitles;
@synthesize authors = _authors;
@synthesize prices = _prices;
@synthesize distances = _distances;
@synthesize images = _images;

@synthesize englishBookTitles = _englishBookTitles;
@synthesize englishAuthors = _englishAuthors;
@synthesize englishPrices = _englishPrices;
@synthesize englishDistances = _englishDistances;
@synthesize englishImages = _englishImages;

int arrayCount = 0; // all array set to 0?


- (IBAction)updateTableView:(id)sender {
    NSString *text = self.textField.text;
    NSLog(@"Entered text is:%@",text);
    
    if( [text isEqualToString:@"math"] ){
         NSLog(@"math entered");
        arrayCount = 1;
    }else if ( [text isEqualToString:@"english"]){
        NSLog(@"english entered");
        arrayCount = 2;
    }else{
        NSLog(@"entered else");
        arrayCount = 0; // set back to default array or all items ary.
    }
    

    [[self tableView] reloadData];
    
}

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

/////ENGLISH Array/////

- (NSArray *)englishBookTitles
{
    if (!_englishBookTitles) {
        _englishBookTitles = @[@"English101: Literature", @"English for Dummies", @"English: We Speak gewd yes.", @"English: The Untold Stories", @"English."];
    }
    return _englishBookTitles;
}

- (NSArray *)englishAuthors
{
    if (!_englishAuthors) {
        _englishAuthors = @[@"Jonathon Park", @"Jacob Streutt", @"William Blen", @"Horace Boragio, Jackson Scott", @"Patrick J. Poelst"];
    }
    return _englishAuthors;
}

- (NSArray *)englishPrices
{
    if (!_englishPrices) {
        _englishPrices = @[@"$35", @"$10", @"$130", @"$453.33", @"$365.33"];
    }
    return _englishPrices;
}

- (NSArray *)englishDistances
{
    if (!_englishDistances) {
        _englishDistances = @[@"0.4 mi", @"1.6 mi", @"0.4 mi", @"1.0 mi", @".1 mi"];
    }
    return _englishDistances;
}


//////////


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    self.searchField.enabled = TRUE;
    [self.createListingButton setHidden:FALSE];
    [self.tableView setHidden:TRUE];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)searchButton:(UIButton *)sender {
    [self.createListingButton setHidden:TRUE];
    [self.tableView setHidden:FALSE];
}

#pragma mark - UITableView Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if( arrayCount == 0 || arrayCount == 1 ){
        return [self.bookTitles count];
    }
    return [self.englishBookTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"BookCell" ];
        cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
    }
    
    
    if(arrayCount == 2){
        cell.titleLabel.text = [self.englishBookTitles objectAtIndex:indexPath.row];
        cell.priceLabel.text = [self.englishPrices objectAtIndex:indexPath.row];
        cell.distanceAwayLabel.text = [self.englishDistances objectAtIndex:indexPath.row];
        cell.authorLabel.text = [self.englishAuthors objectAtIndex:indexPath.row];
        
    }else{
        cell.titleLabel.text = [self.bookTitles objectAtIndex:indexPath.row];
        cell.priceLabel.text = [self.prices objectAtIndex:indexPath.row];
        cell.distanceAwayLabel.text = [self.distances objectAtIndex:indexPath.row];
        cell.authorLabel.text = [self.authors objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - TextField Delegates
// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text: %@", textField.text);
    NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
