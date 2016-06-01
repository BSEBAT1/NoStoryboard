//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutlet UITextView *messageTextView;
@property (strong, nonatomic) IBOutlet UIImageView *IconView;


@end

@implementation ChatCell

- (void)awakeFromNib
{
    // Initialization code
self.IconView.layer.cornerRadius = self.IconView.frame.size.height/2;
self.IconView.clipsToBounds = YES;
 //Divide object by half its height to get a circle !

}




- (void)loadWithData:(ChatData *)chatData
{
    
    self.usernameLabel.text = chatData.username;
    self.messageTextView.text = chatData.message;
    
   //Asynch loading for smoother user expereince
dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSURL *url = [[NSURL alloc] initWithString:chatData.avatar_url];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
       
        dispatch_async(dispatch_get_main_queue(), ^{
            self.IconView.image = image;
        //always update ui on main queue 
            
        });  
    });
    
}


@end
