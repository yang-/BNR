//
//  main.m
//  RandomItems
//
//  Created by Yang Chen on 5/30/14.
//  Copyright (c) 2014 Yang Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContianer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSMutableArray * items = [[NSMutableArray alloc] init];
        
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        [items insertObject:@"Zero" atIndex:0];
//        
////        for (int i = 0; i < [items count]; i++) {
////            NSString *item = [items objectAtIndex:i];
////            NSLog(@"%@", item);
////        }
//        
//        for (NSString *item in items) {
//            NSLog(@"%@", item);
//        }
//        
////        BNRItem *item = [[BNRItem alloc] init];
////        item.itemName = @"Red Sofa";
////        item.serialNumber = @"A1B2C";
////        item.valueInDollars = 100;
////        NSLog(@"%@ %@ %@ %d", item.itemName, item.dateCreated, item.serialNumber, item.valueInDollars);
//        
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                           valueInDollars:100
//                                             serialNumber:@"A1B2C"];
//        NSLog(@"%@", item);
//        
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        NSLog(@"%@", itemWithName);
//        
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//        NSLog(@"%@", itemWithNoName);
//
//        for (int i = 0; i < 10; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject:item];
//        }
        
//        id lastObj = [items lastObject];
//        [lastObj count];
        
//        for (BNRItem *item in items) {
//            NSLog(@"%@", item);
//        }
        
//        NSLog(@"%@", items[10]);
        
//        BNRItem *testItem = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                                 serialNumber:@"A1B2C"];
//        NSLog(@"%@", testItem);
        
        
        // Gold Challenge
//        BNRContianer *contianer = [[BNRContianer alloc] initWithItemName:@"Contianer Item"
//                                                          valueInDollars:100
//                                                            serialNumber:@"A1B2C"
//                                                                subitems:items];
//        NSLog(@"%@", contianer);
        
        
//        BNRContianer *randomContianer = [BNRContianer randomItem];
//        NSLog(@"%@", randomContianer);
        
//        items = nil;

        BNRContianer *contianer = [[BNRContianer alloc] initWithItemName:@"Contianer Item"
                                                          valueInDollars:100
                                                            serialNumber:@"A1B2C"
                                                                subitems:@[[BNRContianer randomItem], [BNRItem randomItem], [BNRContianer randomItem]]];
        NSLog(@"%@", contianer);
    }
    return 0;
}

