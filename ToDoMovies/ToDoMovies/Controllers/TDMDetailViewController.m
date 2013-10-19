//
//  TDMDetailViewController.m
//  ToDoMovies
//
//  Created by Craig Clayton on 10/18/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import <Social/Social.h>
#import "TDMDetailViewController.h"
#import "TDMMovie.h"
#import "TDMCastViewController.h"
#import "JMImageCache.h"
#import "SIAlertView.h"

@interface TDMDetailViewController ()

@end

@implementation TDMDetailViewController

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
    
    DDLogInfo(@"%@", self.objMovie);
    self.title = self.objMovie.title;
    [self.imgMovieFull setImageWithURL:[NSURL URLWithString:self.objMovie.full_image] placeholder:[UIImage imageNamed:@""]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"movieCasts"])
    {
        UINavigationController *nav = [segue destinationViewController];
        TDMCastViewController *vc = (TDMCastViewController *)nav.topViewController;
        
        NSMutableArray* arrCast = [[NSMutableArray alloc] initWithArray:[[self.objMovie actors] allObjects]];
        vc.arrCasts = arrCast;
        DDLogInfo(@"selected movies %@", [[self.objMovie actors] allObjects]);
    }
}


- (void) shareTwitter
{
    NSString* post = [NSString stringWithFormat:@"#ToDoMovies"];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController* tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:post];
        [self presentViewController:tweetSheet animated:YES completion:nil];
        
        SLComposeViewControllerCompletionHandler completion = ^(SLComposeViewControllerResult result)
        {
            switch (result) {
                case SLComposeViewControllerResultDone:
                    NSLog(@"Posted to Twitter");
                    break;
                    
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Post was cancelled");
                    break;
                    
                default:
                    break;
            }
            
            [tweetSheet dismissViewControllerAnimated:YES completion:nil];
        };
        
        tweetSheet.completionHandler = completion;
    }
    
    else
    {
        [self showAlert:@"Please update your Twitter account settings!"];
    }
}

- (void) shareFacebook
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM dd, yyyy"];
    NSString* post = [NSString stringWithFormat:@"Can't wait for %@ to be released on %@", self.objMovie.title, [formatter stringFromDate:self.objMovie.release_date]];
    
    UIImage* image = [UIImage imageNamed:self.objMovie.thumb];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookSheet setInitialText:post];
        [facebookSheet addImage:image];
        [self presentViewController:facebookSheet animated:YES completion:nil];
        
        SLComposeViewControllerCompletionHandler completion = ^(SLComposeViewControllerResult result)
        {
            switch (result) {
                case SLComposeViewControllerResultDone:
                    NSLog(@"Posted to Facebook");
                    break;
                    
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Post was cancelled");
                    break;
                    
                default:
                    break;
            }
            
            [facebookSheet dismissViewControllerAnimated:YES completion:nil];
        };
        
        facebookSheet.completionHandler = completion;
    }
    else
    {
        [self showAlert:@"Please update your Facebook account settings!"];
    }
    
}

- (void) showAlert:(NSString *)message
{
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Attention!" andMessage:NSLocalizedString(message,message)];
    
    [alertView addButtonWithTitle:@"OK"
                             type:SIAlertViewButtonTypeDestructive
                          handler:^(SIAlertView *alert) {
                              NSLog(@"Cancel");
                          }];
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    [alertView show];
}

- (void)viewDidUnload {
    [self setImgMovieFull:nil];
    [super viewDidUnload];
}




- (IBAction)onTwitterTapped:(id)sender
{
    [self shareTwitter];
}

- (IBAction)onFacebookTapped:(id)sender
{
    [self shareFacebook];
}
@end
