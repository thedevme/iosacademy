//
//  IATestViewController.m
//  RecipeExample
//
//  Created by Craig Clayton on 10/5/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import "IATestViewController.h"

@interface IATestViewController ()

@end

@implementation IATestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DDLogInfo(@"view did load");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveTapped:(id)sender
{
    NSLog(@"save");
}

@end
