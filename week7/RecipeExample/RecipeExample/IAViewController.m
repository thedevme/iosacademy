//
//  IAViewController.m
//  RecipeExample
//
//  Created by Craig Clayton on 10/4/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import "IAViewController.h"
#import "IARecipeModel.h"
#import "Recipe.h"
#import "Ingredient.h"

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initalize];
}

- (void)initalize
{
    [self setDefaults];
    [self addObservers];
}

- (void) setDefaults
{
    
}

- (void) addObservers
{
    
}

- (void)createModel
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
