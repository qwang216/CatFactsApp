//
//  C4QFetchCatImage.h
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface C4QFetchCatImage : NSObject

@property (nonatomic) NSString *urlString;

-(void)fetchCatImageWithCompletionBlock:(void (^) (UIImage *catImage) )onCompletion;

@end
