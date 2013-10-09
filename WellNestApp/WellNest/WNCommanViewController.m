//
//  WNCommanViewController.m
//  Well Nest
//
//  Created by Narendra Kumar on 08/10/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import "WNCommanViewController.h"

@interface WNCommanViewController ()

@end

@implementation WNCommanViewController

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
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"White_Image_Pattern.png"]]];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
