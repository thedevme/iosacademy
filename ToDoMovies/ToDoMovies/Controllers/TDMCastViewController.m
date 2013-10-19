//
//  TDMCastViewController.m
//  ToDoMovies
//
//  Created by Craig Clayton on 10/19/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import "TDMCastViewController.h"
#import "TDMActor.h"

@interface TDMCastViewController ()

@end

@implementation TDMCastViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initalize];
    self.title = @"Casts";
    DDLogInfo(@"%@", self.arrCasts);
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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.arrCasts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"castCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDMActor* actor = [self.arrCasts objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = actor.name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}





- (IBAction)onDoneTapped:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
