//
//  ViewController.m
//  LikeIBooksDropDownMenu
//
//  Created by obumin on 2014/08/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "DropDownButton.h"

@interface ViewController () <MenuViewControllerDelegate>

@property (weak, nonatomic) IBOutlet DropDownButton *button;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //self.button.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MenuViewController
// When Menu Button Tapped
- (IBAction)showMenu:(id)sender
{
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MenuViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    viewController.delegate = self;

    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:viewController];

    [self presentViewController:navigationController animated:YES completion: nil];
}


-(void)applyString:(NSString *)str
{
    [self.button setTitle:str forState:UIControlStateNormal];
}

// When it closed Menu
-(void)closeMenu:(MenuViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
