//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Yang Chen on 8/10/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

@property (nonatomic, readonly) NSArray *itemsWorthMoreThanFiftyDollars;

@property (nonatomic, readonly) NSArray *itemsWorthLessThanFiftyDollars;

// Notice that this is a class method and prefixed with a + insted of a -
+ (instancetype)sharedStore;

- (BNRItem *)createItem;

@end
