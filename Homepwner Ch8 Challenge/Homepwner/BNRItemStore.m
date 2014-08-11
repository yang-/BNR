//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Yang Chen on 8/10/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic)NSMutableArray *privateItems;

@property (nonatomic) NSMutableArray *worthyItems;

@property (nonatomic) NSMutableArray *cheapItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// If a programer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
        _worthyItems = [[NSMutableArray alloc] init];
        _cheapItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (NSArray *)itemsWorthMoreThanFiftyDollars
{
    return self.worthyItems;
}

- (NSArray *)itemsWorthLessThanFiftyDollars
{
    return self.cheapItems;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    if (item.valueInDollars >= 50) {
        [self.worthyItems addObject:item];
    } else {
        [self.cheapItems addObject:item];
    }
    return item;
}

@end
