//
//  BNRContianer.m
//  RandomItems
//
//  Created by Yang Chen on 7/18/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRContianer.h"

@implementation BNRContianer

+ (instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    // Note: the % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number
    // from 0 to 2 inclusive.
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    // Note that NSInteger is not an object, but a type definition
    // for "long".
    
    //    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
    //                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
    //                            [randomNounList objectAtIndex:nounIndex]];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    int randomListCount = arc4random() % 15;
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (int i = 0; i < randomListCount; i++) {
        items[i] = [BNRItem randomItem];
    }
    
    BNRContianer *newItem = [[self alloc] initWithItemName:randomName
                                            valueInDollars:randomValue
                                              serialNumber:randomSerialNumber
                                                  subitems:[NSArray arrayWithArray:items]];
    return newItem;
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
                        subitems:(NSArray *)items
{
    self = [super initWithItemName:name
                    valueInDollars:value
                      serialNumber:sNumber];
    if (self) {
        _subitems = items;
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
                        subitems:(NSArray *)items

{
    self = [super initWithItemName:name];
    if (self) {
        _subitems = items;
    }
    return self;
}

- (instancetype)initWIthSubitems:(NSArray *)items
{
    self = [super init];
    if (self) {
        _subitems = items;
    }
    return self;
}

// override inherent initializer
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    if (self) {
        _subitems = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
    self = [super initWithItemName:name];
    if (self) {
        _subitems = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber
{
    self = [super initWithItemName:name
                      serialNumber:sNumber];
    if (self) {
        _subitems = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _subitems = [[NSArray alloc] init];
    }
    return self;
}

- (void)setSubitems:(NSArray *)items
{
    _subitems = items;
}

- (NSArray *)subitems
{
    return _subitems;
}

- (int)valueInDollars
{
    int value = super.valueInDollars;
    for (int i = 0; i< [_subitems count]; i++) {
        value += [_subitems[i] valueInDollars];
    }
    return value;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d (Contianer only $%d), recorded on %@. Subitems: %@", self.itemName, self.serialNumber, self.valueInDollars, super.valueInDollars, self.dateCreated, self.subitems];
    return descriptionString;
}

@end
