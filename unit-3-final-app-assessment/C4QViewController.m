//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"

@interface C4QViewController () <ColorPickerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *onwardButton;

@end

@implementation C4QViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)colorSelected:(UIColor *)color{
    self.view.backgroundColor = color;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"colorSelectSegue"]) {
        C4QColorPickerViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

@end
