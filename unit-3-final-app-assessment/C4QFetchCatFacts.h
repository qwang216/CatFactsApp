//
//  C4QFetchCatFacts.h
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface C4QFetchCatFacts : NSObject
@property (nonatomic) NSString *urlString;

-(void)fetchCatFactsWithCompletionBlock:(void (^) (NSArray *catFacts, NSError *error))onCompletion;

@end
