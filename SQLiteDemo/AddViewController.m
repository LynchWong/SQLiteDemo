//
//  AddViewController.m
//  SQLiteDemo
//
//  Created by Lynch on 7/3/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import "AddViewController.h"
#import "SQLService.h"

@interface AddViewController ()

@end

@implementation AddViewController

@synthesize nameField = _nameField;
@synthesize idField = _idField;
@synthesize phoneField = _phoneField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(80, 100, 160, 30)];
    _idField = [[UITextField alloc] initWithFrame:CGRectMake(80, 140, 160, 30)];
    _phoneField = [[UITextField alloc] initWithFrame:CGRectMake(80, 180, 160, 30)];
    
    _nameField.borderStyle = UITextBorderStyleRoundedRect;
    _nameField.textAlignment = NSTextAlignmentCenter;
    _nameField.placeholder = @"请输入姓名";
    
    _idField.borderStyle = UITextBorderStyleRoundedRect;
    _idField.textAlignment = NSTextAlignmentCenter;
    _idField.placeholder = @"请输入ID";
    
    _phoneField.borderStyle = UITextBorderStyleRoundedRect;
    _phoneField.textAlignment = NSTextAlignmentCenter;
    _phoneField.placeholder = @"请输入电话号码";
    
    [self.view addSubview:_nameField];
    [self.view addSubview:_idField];
    [self.view addSubview:_phoneField];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addDone)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addDone
{
    NSString *nameText = _nameField.text;
    NSString *idText = _idField.text;
    NSString *phoneText = _phoneField.text;
    
    if (nameText.length > 0 && idText.length > 0 && phoneText.length > 0) {
        SQLService *sqlService = [[SQLService alloc] init];
        Entity *entity = [[Entity alloc] init];
        entity.sqlId = [idText intValue];
        entity.sqlName = nameText;
        entity.sqlText = phoneText;
        if ([sqlService insertData:entity]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"插入数据成功"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"插入数据失败"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"所有项目必须填写"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
