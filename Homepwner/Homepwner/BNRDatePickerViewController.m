//
//  BNRDatePickerViewController.m
//  Homepwner
//
//  Created by Yang Chen on 8/13/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRDatePickerViewController.h"
#import "BNRItem.h"

@interface BNRDatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDatePickerViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.date = self.item.dateCreated;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    // Clear first responder
//    [self.view endEditing:YES];
    self.item.dateCreated = self.datePicker.date;
}


@end
