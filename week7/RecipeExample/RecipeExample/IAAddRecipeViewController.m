//
//  IAAddRecipeViewController.m
//  RecipeExample
//
//  Created by Craig Clayton on 10/5/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import "IAAddRecipeViewController.h"
#import "Recipe.h"
#import "Ingredient.h"
#import "IARecipeModel.h"

@interface IAAddRecipeViewController ()

@end

@implementation IAAddRecipeViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveTapped:(id)sender
{
    NSString* ingredients = self.txtIngredient.text;
    NSArray* arrIngredients = [ingredients componentsSeparatedByString:@", "];
    
    NSManagedObjectContext* context = [[IARecipeModel sharedDataModel] mainContext];
    
    Recipe* recipe = [Recipe insertInManagedObjectContext:context];
    recipe.name = self.txtRecipeName.text;
    
    for (int i = 0; i < [arrIngredients count]; i++)
    {
        Ingredient* ingredient = [Ingredient insertInManagedObjectContext:context];
        ingredient.name = [arrIngredients objectAtIndex:i];
        ingredient.recipe = recipe;
    }
    
    [context save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)dismissView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
