//
//  IAAddRecipeViewController.h
//  RecipeExample
//
//  Created by Craig Clayton on 10/5/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAAddRecipeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtRecipeName;
@property (strong, nonatomic) IBOutlet UITextField *txtIngredient;

- (IBAction)onSaveTapped:(id)sender;
- (IBAction)dismissView:(id)sender;

@end
