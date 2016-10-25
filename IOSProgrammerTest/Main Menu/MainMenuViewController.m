//
//  ViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ChatSectionViewController.h"
#import "LoginSectionViewController.h"
#import "AnimationSectionViewController.h"


@interface MainMenuViewController ()

@end

@implementation MainMenuViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

#pragma mark –Set Background
    
UIImage *image = [UIImage imageNamed:@"bg_main_menu"];
[self.navigationItem setHidesBackButton:YES animated:NO];
UIImageView *backgroundView = [[UIImageView alloc] initWithImage:image];
    
backgroundView.frame = self.view.bounds;
[[self view] addSubview:backgroundView];
[self.view insertSubview:backgroundView atIndex:0];
    
    
}
- (void) viewWillAppear:(BOOL)animated {
    self.navigationItem.title = @"Coding Tasks";
    //Always display title in nav bar even if you get there with back button
}



- (IBAction)tableSectionAction:(id)sender
{
    ChatSectionViewController *tableSectionViewController = [[ChatSectionViewController alloc] init];
    [self.navigationController pushViewController:tableSectionViewController animated:YES];
}
- (IBAction)apiSectionAction:(id)sender
{
    LoginSectionViewController *apiSectionViewController = [[LoginSectionViewController alloc] init];
    [self.navigationController pushViewController:apiSectionViewController animated:YES];
}
- (IBAction)animationSectionAction:(id)sender
{
    AnimationSectionViewController *animationSectionViewController = [[AnimationSectionViewController alloc] init];
    [self.navigationController pushViewController:animationSectionViewController animated:YES];
}
@end