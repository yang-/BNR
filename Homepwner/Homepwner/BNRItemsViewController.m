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
#import "BNRDetailViewController.h"

@interface BNRItemsViewController ()

//@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        // Create a new bar button item that will send
        // addNewItem: to BNRItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        // Set this bar button item as the right item in the navigationItem
        navItem.rightBarButtonItem = bbi;
        
        navItem.leftBarButtonItem = self.editButtonItem;
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
    
//    UIView *header = self.headerView;
//    [self.tableView setTableHeaderView:header];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    if (indexPath.row < [items count]) {
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    } else {
        cell.textLabel.text = @"No more items";
    }
//    BNRItem *item = items[indexPath.row];
//    
//    cell.textLabel.text = [item description];
    
    return cell;
}

//- (UIView *)headerView
//{
//    // If you have not loaded the headerView yet...
//    if (!_headerView) {
//        // Load HeaderView.xib
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    return _headerView;
//}

- (IBAction)addNewItem:(id)sender
{
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    // Figure out where that item is in the array
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    // Insert this new row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

//- (IBAction)toggleEditingMode:(id)sender
//{
//    // If you are currently in editing mode...
//    if (self.isEditing) {
//        // Change text of button to inform user of state
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        
//        // Turn off editing mode
//        [self setEditing:NO animated:YES];
//    } else {
//        // Change text of button to inform user of state
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        // Enter editing mode
//        [self setEditing:YES animated:YES];
//    }
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        // Also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    if (indexPath.row < [items count]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    if (indexPath.row < [items count]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    if (proposedDestinationIndexPath.row < [items count]) {
        return proposedDestinationIndexPath;
    } else {
        return sourceIndexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] init];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    if (indexPath.row < [items count]) {
    
        BNRItem *selectedItem = items[indexPath.row];
        // Give detail view controller a pointer to the item object in row
        detailViewController.item = selectedItem;
    
        // Push it onto the top of the navigation controller's stack
        [self.navigationController pushViewController:detailViewController animated:YES];

    } else {
        return;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

@end
