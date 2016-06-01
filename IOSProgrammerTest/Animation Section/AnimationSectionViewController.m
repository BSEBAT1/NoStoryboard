//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"

@interface AnimationSectionViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AnimationSectionViewController

- (void)viewDidLoad
{
#pragma mark –Set Title
[super viewDidLoad];
self.title=@"Animation";
self.navigationController.navigationBar.topItem.title = @"";
//Creates blank back arrow
    
}

//- (IBAction)backAction:(id)sender
//{
//    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
//    [self.navigationController pushViewController:mainMenuViewController animated:YES];
//}
//Using The Back Button Provided in Navigation Bar


#pragma mark –Animation Functions

- (IBAction)ButtonPressed:(id)sender {
    
    [self rotateImageView];
}

- (IBAction)ButtonReleased:(id)sender {
    [self.imageView.layer removeAllAnimations];
    
}


- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
CGPoint translation = [recognizer translationInView:self.view];
recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
[recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
  //Use Gesture Recog for moving image
}

- (void)rotateImageView
{
[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.imageView setTransform:CGAffineTransformRotate(self.imageView.transform, M_PI_2)];
    }completion:^(BOOL finished){
        if (finished) {
            [self rotateImageView];
            //Completion Calls Self To Continue Spin
        }
    }];
}
@end
