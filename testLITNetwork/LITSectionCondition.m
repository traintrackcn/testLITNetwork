//
//  LITSectionItem.m
//  testLITNetwork
//
//  Created by traintrackcn on 2018/6/16.
//  Copyright © 2018 traintrackcn. All rights reserved.
//

#import "LITSectionCondition.h"
#import "TestDeallocVC.h"

typedef NS_ENUM(NSInteger, Cell) {
    CellTestDealloc,
    CellCount
};

@implementation LITSectionCondition

- (Class)clsAtIndex:(NSInteger)index{
    return [LITTriggerCellLongTitle class];
}

- (NSInteger)numberOfRows{
    return CellCount;
}

- (id)titleAtIndex:(NSInteger)index{
    if (index == CellTestDealloc) {
        return @"Test Dealloc";
    }
    return [super titleAtIndex:index];
}

- (id)valueAtIndex:(NSInteger)index{
    return @"";
}

- (void)action:(id)action atIndex:(NSInteger)index{
    if (index == CellTestDealloc){
        TestDeallocVC *vc = [TestDeallocVC instance];
        [self.associatedVC pushViewController:vc];
    }
}

- (id)parameterAtIndex:(NSInteger)index{
    LITCellCharacter *c = [LITCellCharacter instance];
    [c setBorderBottom:YES];
    return c;
}

@end
