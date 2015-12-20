//
//  CatFactTableViewCell.h
//  unit-3-final-app-assessment
//
//  Created by Jason Wang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SavedCatFactDelegate <NSObject>

-(void)saveCatFactDidSaved:(BOOL)didSaved;

@end


@interface CatFactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *catFactLabel;
@property (nonatomic) NSMutableArray *savedcatFacts;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) id <SavedCatFactDelegate> delegate;

@end
