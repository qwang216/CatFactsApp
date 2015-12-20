//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import "CatFactTableViewCell.h"
#import "C4QCatFactsDetailViewController.h"
#import "C4QFetchCatFacts.h"

#import <AFNetworking/AFNetworking.h>

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController () <SavedCatFactDelegate>

@property (nonatomic) NSArray *catFacts;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    C4QFetchCatFacts *catFetch = [C4QFetchCatFacts new];
    catFetch.urlString = CAT_API_URL;
    [catFetch fetchCatFactsWithCompletionBlock:^(NSArray *catFacts, NSError *error) {
        if (!error) {
            self.catFacts = catFacts;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.userInfo);
        }
    }];
}

-(void)saveCatFactDidSaved:(BOOL)didTapped{
    if (didTapped) {
        UIAlertController *savedAlert = [UIAlertController alertControllerWithTitle:@"Saved" message:@"To view the saved cat fact list, click the button on top right corner" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [savedAlert addAction:ok];
        [self presentViewController:savedAlert animated:YES completion:nil];
    } else {
        UIAlertController *duplicateFactAlert = [UIAlertController alertControllerWithTitle:@"Already Saved" message:@"This cat fact has been saved before" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [duplicateFactAlert addAction:ok];
        [self presentViewController:duplicateFactAlert animated:YES completion:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailCatFactSegue"]) {
        C4QCatFactsDetailViewController *vc = segue.destinationViewController;
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        vc.catFact = [self.catFacts objectAtIndex:index.row];
    }
}



#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catFacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CatFactTableViewCell *catFactCell = [tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier" forIndexPath:indexPath];
    catFactCell.delegate = self;
    catFactCell.catFactLabel.text = self.catFacts[indexPath.row];
    return catFactCell;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
