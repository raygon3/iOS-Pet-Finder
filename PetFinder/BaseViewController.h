//
//  BaseViewController.h
//  PetFinder
//
//  Created by Raymond G on 11/22/12.
//
//

#import <UIKit/UIKit.h>
#import "Animal.h"
#import "AnimalCell.h"
#import "AnimalData.h"
#import "FavoriteAnimalStore.h"
#import "Utilities.h"
#import "CSVAnimalController.h"
#import "DetailViewController.h"
#import "FilterViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BaseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray* filteredData;
@property (nonatomic,strong)NSArray* unfilteredData;

-(void)refreshData;
-(void)filterData;
@end
