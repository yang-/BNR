//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Yang Chen on 8/10/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
        [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]]];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Worth more than $50";
    } else {
        return @"Worth less than $50";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [[[BNRItemStore sharedStore] allItems] count];
    if (section == 0) {
        return [[[BNRItemStore sharedStore] itemsWorthMoreThanFiftyDollars] count];
    } else {
        return [[[BNRItemStore sharedStore] itemsWorthLessThanFiftyDollars] count] + 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        NSArray *items = [[BNRItemStore sharedStore] itemsWorthMoreThanFiftyDollars];
        BNRItem *item = items[indexPath.row];
        
        cell.textLabel.text = [item description];
        cell.textLabel.font = [UIFont systemFontOfSize:20];
    } else {
        NSArray *items = [[BNRItemStore sharedStore] itemsWorthLessThanFiftyDollars];
        if (indexPath.row < [items count]) {
            BNRItem *item = items[indexPath.row];
            cell.textLabel.text = [item description];
            cell.textLabel.font = [UIFont systemFontOfSize:20];
        } else {
            cell.textLabel.text = @"No more items";
        }
        
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cheapItems = [[BNRItemStore sharedStore] itemsWorthLessThanFiftyDollars];
    if (indexPath.section == 1 && indexPath.row == cheapItems.count) {
        return 44;
    } else {
        return 60;
    }
}

@end
