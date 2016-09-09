//
//  DecayViewController.m
//  PopAnimation
//
//  Created by lx on 16/9/9.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "DecayViewController.h"

@interface DecayViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation DecayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    POPDecayAnimation *decayAn = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    //velocity速度
    decayAn.velocity = @(600);

    //deceleration:0.998  衰减系数(越小则衰减得越快)
//    decayAn.deceleration = 0.65;
    decayAn.beginTime = CACurrentMediaTime() + 0.5f;
    [self.redView pop_addAnimation:decayAn forKey:nil];
    
    
}



@end
