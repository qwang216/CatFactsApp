//
//  C4QFetchCatImage.m
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QFetchCatImage.h"

@implementation C4QFetchCatImage

-(void)fetchCatImageWithCompletionBlock:(void (^) (UIImage *catImage) )onCompletion{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:self.urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        int upperBound = [[responseObject[@"pagination"] objectForKey:@"count"] intValue];
        int randomNumber = arc4random_uniform(upperBound);
        
        NSDictionary *randomDictionary = responseObject[@"data"][randomNumber];
        NSString *urlString = randomDictionary[@"images"][@"fixed_height_downsampled"][@"url"];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            UIImage *image = [UIImage imageWithData:imageData];
            dispatch_sync(dispatch_get_main_queue(), ^{
                onCompletion(image);
            });
            
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"C4Q cat fetching image failed == %@",error);
    }];
}

@end
