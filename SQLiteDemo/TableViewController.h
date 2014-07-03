//
//  TableViewController.h
//  SQLiteDemo
//
//  Created by Lynch on 7/3/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLService.h"

@interface TableViewController : UITableViewController

@property (nonatomic, strong) SQLService *sqlService;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
