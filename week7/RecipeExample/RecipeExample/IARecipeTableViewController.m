//
//  IARecipeTableViewController.m
//  RecipeExample
//
//  Created by Craig Clayton on 10/5/13.
//  Copyright (c) 2013 iOSAcademy. All rights reserved.
//

#import "IARecipeTableViewController.h"
#import "IARecipeCell.h"
#import "IARecipeModel.h"
#import "Recipe.h"
#import "Ingredient.h"


@interface IARecipeTableViewController ()

@property (strong, nonatomic) NSMutableArray* arrRecipes;

@end

@implementation IARecipeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
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
    self.arrRecipes = [[NSMutableArray alloc] initWithArray:[[IARecipeModel sharedDataModel] findAllRecipes]];
}

- (void) addObservers
{
    
}

- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"view will appear");
    
    
    [self setDefaults];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.arrRecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"recipeCell";
    IARecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(IARecipeCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Recipe* objRecipe = [self.arrRecipes objectAtIndex:[indexPath row]];
    cell.lblRecipeName.text = objRecipe.name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
