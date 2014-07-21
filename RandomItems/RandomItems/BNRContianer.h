//
//  BNRContianer.h
//  RandomItems
//
//  Created by Yang Chen on 7/18/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContianer : BNRItem
{
    NSArray *_subitems;
}

+ (instancetype)randomItem;

// Designated initializer
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
                        subitems:(NSArray *)items;

- (instancetype)initWithItemName:(NSString *)name
                        subitems:(NSArray *)items;

- (void)setSubitems:(NSArray *)items;
- (NSArray *)subitems;

@end
