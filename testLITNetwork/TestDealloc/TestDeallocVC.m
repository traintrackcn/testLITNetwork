//
//  TestDeallocVC.m
//  testLITNetwork
//
//  Created by traintrackcn on 2018/6/16.
//  Copyright © 2018 traintrackcn. All rights reserved.
//

#import "TestDeallocVC.h"
#import "LITLoaderRedmineQueryCount.h"

@interface TestDeallocVC (){
    NSInteger loading;
}

@property (nonatomic, strong) NSMutableDictionary *loaders;
//@property (nonatomic, weak) id ws;

@end

@implementation TestDeallocVC

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"Test Dealloc"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self batchRequest];
//    [self request];
}

//- (void)viewWillDisappear:(BOOL)animated{
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
}

#pragma mark - remote ops

- (void)batchRequest{
    for (NSInteger i = 0; i<20; i++) {
        [self request];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    [self setLoaders:nil];
}

- (void)request{
    loading ++;
    LITLoaderRedmineQueryCount *l = [LITLoaderRedmineQueryCount instance];
    __weak id ws = self;
    [self.loaders setValue:l forKey:l.key];
    [l requestWithCompletion:^(LITJSONLoaderResponse *res) {
        [ws requestCallback:res];
    }];
}

- (void)requestCallback:(LITJSONLoaderResponse *)res{
    loading --;
    TLOG(@"loading -> %@", @(loading));
    if ([self setMessagesForError:res.parsedError]) return;
    TLOG(@"res.parsedData -> %@", res.parsedData);
}

#pragma mark -

- (NSMutableDictionary *)loaders{
    if (!_loaders){
        _loaders = [NSMutableDictionary dictionary];
    }
    return _loaders;
}

@end
