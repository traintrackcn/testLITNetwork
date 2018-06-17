//
//  LITLoaderRedmineQueryCount.m
//  LITMonitor
//
//  Created by traintrackcn on 2018/5/31.
//  Copyright © 2018 abovegem. All rights reserved.
//

#import "LITLoaderRedmineQueryCount.h"

@implementation LITLoaderRedmineQueryCount

- (id)headers{
    return @{
             @"X-Device-UUID" : @"37572D24-90E5-4407-BAD6-A7E9E694307F",
             @"X-Redmine-API-Key" : @"289e920aedc4a5a2f53bcc1f3f6387dc755744e9",
             @"x-user-id" : @"5"
             };
}



- (id)parseRawData:(id)raw{
    TLOG(@"raw -> %@", raw);
//    id totalCount = [raw objectForKey:@"total_count"];
    return [raw objectForKey:@"total_count"];
}

- (NSString *)requestType{
    return @"issues.json?project_id=48&query_id=76&limit=1";
}

- (id)serverUrl{
    return @"http://tracker.abovegem.com";
}

- (NSString *)apiVersion{
    return BLANK_API_VERSION;
}

//http://tracker.abovegem.com/issues.json?project_id=48&query_id=76&limit=1

@end
