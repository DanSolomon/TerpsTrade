//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "MainViewController.h"
#import "NewPostingViewController.h"

@interface SideMenuViewController()

@property (nonatomic, copy) NSArray *sideMenuButtonNames;

@end

@implementation SideMenuViewController


@synthesize sideMenuButtonNames = _sideMenuButtonNames;


- (NSArray*)sideMenuButtonNames
{
  if (!_sideMenuButtonNames) {
    _sideMenuButtonNames = @[@"Profile", @"Inbox", @"New Listing", @"Settings"];
  }
  return _sideMenuButtonNames;
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"TerpsTrade";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sideMenuButtonNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
  cell.textLabel.text = [self.sideMenuButtonNames objectAtIndex:indexPath.row];
  
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  NewPostingViewController *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewPostingViewController"];
  
  UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
  NSArray *controllers = [NSArray arrayWithObject:demoViewController];
  //navigationController.viewControllers = controllers;
  [navigationController pushViewController:demoViewController animated:YES];
  [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

@end