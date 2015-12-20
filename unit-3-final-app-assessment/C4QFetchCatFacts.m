//
//  C4QFetchCatFacts.m
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QFetchCatFacts.h"
#import <AFNetworking/AFNetworking.h>

@implementation C4QFetchCatFacts

-(void)fetchCatFactsWithCompletionBlock:(void (^) (NSArray *catFacts, NSError *error))onCompletion{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/javascript"];
    [manager GET:self.urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *facts = [[NSArray alloc]initWithArray:responseObject[@"facts"]];
        onCompletion(facts,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        onCompletion(nil, error);
        
    }];
}

@end
