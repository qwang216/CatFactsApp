//
//  CatFactTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CatFactTableViewCell.h"

@implementation CatFactTableViewCell
- (IBAction)catFactSaveButtonTapped:(UIButton *)sender {
    self.savedcatFacts = [NSMutableArray new];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"]) {
        self.savedcatFacts = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"]];
    }
    
    if (![self.savedcatFacts containsObject:self.catFactLabel.text]) {
        [self.savedcatFacts addObject:self.catFactLabel.text];
        [[NSUserDefaults standardUserDefaults] setObject:self.savedcatFacts forKey:@"savedCatFacts"];
        [self.delegate saveCatFactDidSaved:YES];
    } else {
        [self.delegate saveCatFactDidSaved:NO];
    }
    
}

- (void)awakeFromNib {
    [self.saveButton setBackgroundImage:[UIImage imageNamed:@"add_icon"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
