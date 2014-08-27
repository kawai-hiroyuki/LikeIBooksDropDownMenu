//
//  ViewController.m
//  LikeIBooksDropDownMenu
//
//  Created by obumin on 2014/08/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"

@interface ViewController () <MenuViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Button Setting
    [self.button setImage:[UIImage imageNamed:@"arrow-down"] forState:UIControlStateNormal];
    CGFloat titleWidth = self.button.titleLabel.bounds.size.width;
    CGFloat imageWidth = self.button.imageView.bounds.size.width;
    // Title is left Image is right
    self.button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
    self.button.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth, 0, -titleWidth);

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
