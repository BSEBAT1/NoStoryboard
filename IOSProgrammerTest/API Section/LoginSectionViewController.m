//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"

@interface LoginSectionViewController ()
@property (strong, nonatomic) IBOutlet UITextField *Username;
@property (strong, nonatomic) IBOutlet UITextField *UserPassword;

@end

@implementation LoginSectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Login";
    self.navigationController.navigationBar.topItem.title = @"";
    UIColor *color = [[UIColor alloc]initWithRed:53.7/255.00 green:53.7/255.00 blue:53.7/255.00 alpha:0.5];
    self.Username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"UserName" attributes:@{NSForegroundColorAttributeName: color}];
    self.UserPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
  //Setting Custom Background for Input
    
}

#pragma mark –Connection Functions

- (IBAction)LogInPressed:(id)sender {
NSString *postDataString = [NSString stringWithFormat:@"username=%@&password=%@",self.Username.text,self.UserPassword.text];

NSDate *methodStart = [NSDate date];
    //Time Length of Method

NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //Init URl Session
    
NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
NSURL *url = [NSURL URLWithString:@"http://www.berkaysebat.com/myprocessingscript.php"];
    
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPBody = [postDataString dataUsingEncoding:NSUTF8StringEncoding];
request.HTTPMethod = @"POST";

NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        self.jsonDictB=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
NSDate *methodFinish = [NSDate date];
//Method Ends
        self.length =[methodFinish timeIntervalSinceDate:methodStart];
//Save Exec Time
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self displayResults];
            //Always update UI on main queue
        });
 
        
    }];
    
    [postDataTask resume];
   
    
   
    
}


-(void)displayResults{
NSString *code=[self.jsonDictB objectForKey:@"code"];
NSString *message=[self.jsonDictB objectForKey:@"message"];
NSString *api_preface=@"Api Call Length";
NSString *value=[NSString stringWithFormat:@"%f", self.length];
#pragma mark –Create Alert
    
NSString *joinString=[NSString stringWithFormat:@"%@%@\r%@",message,api_preface,value];
    
UIAlertController * alert=[UIAlertController
                                  alertControllerWithTitle:code
                                  message:joinString
                                  preferredStyle:UIAlertControllerStyleAlert];
    
UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {[self backAction];
                             
                         }];
    
[alert addAction:ok];
[self presentViewController:alert animated:YES completion:^{
        }];
}



//Repurposed This Back Action For Alertview Navigation
- (void)backAction
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

@end
