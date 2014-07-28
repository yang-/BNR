//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Yang Chen on 7/23/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet BNRHypnosisView *hypnosisView;

@end

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        // Put that image on the tab bar item
        self.tabBarItem.image = i;
    }
    return self;
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
    [self.segmentedControl addTarget:self action:@selector(setHypnosisColor:) forControlEvents:UIControlEventValueChanged];
}

- (void)setHypnosisColor:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSArray *segmentedControlColor = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
    
    [self.hypnosisView setCircleColor:segmentedControlColor[[segmentedControl selectedSegmentIndex]]];
}

@end
