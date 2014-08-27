//
//  MenuViewController.h
//  LikeIBooksDropDownMenu
//
//  Created by obumin on 2014/08/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewControllerDelegate;

@interface MenuViewController : UITableViewController

@property (weak, nonatomic) id<MenuViewControllerDelegate> delegate;

@end

@protocol MenuViewControllerDelegate <NSObject>

-(void)applyString:(NSString *)str;

-(void)closeMenu:(MenuViewController *)controller;

@end
