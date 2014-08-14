//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Yang Chen on 8/12/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRDatePickerViewController.h"

@interface BNRDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)changeDate:(id)sender;

@end

@implementation BNRDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    // You need an NSDateFormatter that will turn a date into a simple date string
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    // Use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.nameField resignFirstResponder];
    [self.serialNumberField resignFirstResponder];
    [self.valueField resignFirstResponder];
}

- (IBAction)changeDate:(id)sender
{
    BNRDatePickerViewController *datePickerViewController = [[BNRDatePickerViewController alloc] init];
    datePickerViewController.item = self.item;
    
    [self.navigationController pushViewController:datePickerViewController animated:YES];
}
@end
