//
//  MenuViewController.m
//  LikeIBooksDropDownMenu
//
//  Created by obumin on 2014/08/27.
//  Copyright (c) 2014年 Kawai Hiroyuki. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (strong, nonatomic) NSArray *objects;
@end

@implementation MenuViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView flashScrollIndicators];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.objects = @[@"Abe Masakatsu",
                     @"Achako Hisamoto",
                     @"Adachi Yasumori",
                     @"Adachi Kagemori",
                     @"Adams, William (Foreign born)",
                     @"Aiou Mototsuna",
                     @"Akao Kiyotsuna",
                     @"Akechi Mitsuhide",
                     @"Akiyama Nobutomo",
                     @"Amago Haruhisa"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.textLabel.text = self.objects[indexPath.row];
    
    return cell;
}


// セルを押したときの処理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 選択したセル情報をDelegateに送る
    [self.delegate applyString:self.objects[indexPath.row]];
    // ビューを閉じる
    [self.delegate closeMenu:self];
}

// このViewControllerを閉じる処理
- (IBAction)close:(id)sender {
    [self.delegate closeMenu:self];
}


@end
