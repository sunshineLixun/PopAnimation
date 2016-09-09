//
//  ViewController.m
//  PopAnimation
//
//  Created by lx on 16/9/9.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "ViewController.h"

#import "BasicViewController.h"
#import "SpringViewController.h"
#import "DecayViewController.h"

static NSString * const cellID = @"cell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *popAnimations;

@end

@implementation ViewController

- (NSArray *)popAnimations
{
    if (!_popAnimations) {
        _popAnimations = @[@"Basic",@"Spring",@"Decay"];
    }
    return _popAnimations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.title = @"POPAnimation";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.tableView.indexPathForSelectedRow) {
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    }
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.popAnimations.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.popAnimations[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:
        {
            BasicViewController *basic = [storyboard instantiateViewControllerWithIdentifier:@"Basic"];
            basic.navigationItem.title = self.popAnimations[indexPath.row];
            [self.navigationController pushViewController:basic animated:YES];
        }
            break;
            case 1:
        {
            SpringViewController *spring = [storyboard instantiateViewControllerWithIdentifier:@"Spring"];
            spring.title = self.popAnimations[indexPath.row];
            [self.navigationController pushViewController:spring animated:YES];
        }
            break;
            case 2:
        {
            DecayViewController *decay = [storyboard instantiateViewControllerWithIdentifier:@"Decay"];
            decay.title = self.popAnimations[indexPath.row];
            [self.navigationController pushViewController:decay animated:YES];
        }
            break;
            
        default:
            break;
    }
}



@end
