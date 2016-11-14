//
//  ViewController.m
//  NoStoryboard
//
//  Created by macbook pro on 10/16/16.
//  Copyright © 2016 berkaysebat.com.Practice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize demo=_demo;



- (void)viewDidLoad {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    
    self.table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.demo=@"hello";
   
    NSLog(@"%@", self.demo);
    
    
    
    self.table.dataSource = self;
    self.table.delegate = self;
    [self.table sizeToFit];
    
    [self.view addSubview:self.table];
    
    self.content = @[ @"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
    
    self.table.translatesAutoresizingMaskIntoConstraints=NO;
    
     
    
    self.dot =[[UIImageView alloc] initWithFrame:CGRectZero];
    self.dot.backgroundColor=[UIColor blueColor];
    self.dot.translatesAutoresizingMaskIntoConstraints=NO;
    
    
    self.dot.image=[UIImage imageNamed:@"draw.png"];
    [self.view addSubview:self.dot];
    
NSDictionary *viewsDictionary = @{@"redView":self.table,@"dotview":self.dot};
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[dotview(<=144)]-[redView]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]-|" options:0 metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[dotview]-|" options:0 metrics:nil views:viewsDictionary]];
    
   
    NSLayoutConstraint *equalbottom = [NSLayoutConstraint
        constraintWithItem:self.table
        attribute:NSLayoutAttributeBottom
        relatedBy:NSLayoutRelationEqual
        toItem:self.view
        attribute:NSLayoutAttributeBottom
        multiplier:1.0
        constant:0];
    [self.view addConstraint:equalbottom];

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text =  [_content objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"title of cell %@", [_content objectAtIndex:indexPath.row]);
    CollectionController *myNewCollection = [[CollectionController alloc] init];
    
    // do any setup you need for myNewVC
    
    [self presentViewController:myNewCollection animated:NO completion:nil];
    
}
-(NSString *)demo{
    return _demo;
}
///THIS IS THE MASTER BRANCH// NOT MASTER NOT MASTER 

-(void)setDemo:(NSString *)newdemo{
     _demo=[newdemo stringByAppendingString:@"you created another instance"];
   
}



@end
