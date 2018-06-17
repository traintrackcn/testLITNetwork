//
//  ViewController.m
//  testLITNetwork
//
//  Created by traintrackcn on 2018/6/16.
//  Copyright © 2018 traintrackcn. All rights reserved.
//

#import "ViewController.h"
#import "LITSectionCondition.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionCondition,
    SectionCount
};

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"Conditioins"];
        [self sectionCondition];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - components

- (LITSectionCondition *)sectionCondition{
    LITSectionCondition *s = [self sectionWithClass:[LITSectionCondition class] inSection:SectionCondition];
    return s;
}

#pragma mark - table stuff

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return SectionCount;
}

@end
