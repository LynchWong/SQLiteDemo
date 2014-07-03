//
//  AddViewController.h
//  SQLiteDemo
//
//  Created by Lynch on 7/3/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UIAlertViewDelegate>

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *idField;
@property (nonatomic, strong) UITextField *phoneField;

@end
