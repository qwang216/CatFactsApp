//
//  C4QSavedCatFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSavedCatFactsTableViewController.h"
#import "SavedCatFactTableViewCell.h"

@interface C4QSavedCatFactsTableViewController ()

@property (nonatomic) NSMutableArray *savedCatFacts;

@end

@implementation C4QSavedCatFactsTableViewController
- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSUserDefaults standardUserDefaults] setObject:self.savedCatFacts forKey:@"savedCatFacts"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.savedCatFacts = [NSMutableArray new];
    self.savedCatFacts = [[[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"] mutableCopy];
    self.navigationController.title = @"Saved Cat Facts";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedCatFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedCatFactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedCatFactsCellID" forIndexPath:indexPath];
    cell.savedCatfactLabel.text = self.savedCatFacts[indexPath.row];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma mark - Table view Delegate

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((editingStyle = UITableViewCellEditingStyleDelete)) {
        [self.savedCatFacts removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

@end
