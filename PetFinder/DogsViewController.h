//
//  DogsViewController.h
//  PetFinder
//
//  Created by Raymond G on 11/12/12.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface DogsViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UISearchBar * search;
@property BOOL searching;
@property BOOL canSelectRows;

-(void)searchTableView;

@end
