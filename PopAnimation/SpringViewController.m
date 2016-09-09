//
//  SpringViewController.m
//  PopAnimation
//
//  Created by lx on 16/9/9.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "SpringViewController.h"

@interface SpringViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    1.springBounciness 弹簧弹力 取值范围为[0, 20]，默认值为4
//    2.springSpeed 弹簧速度，速度越快，动画时间越短 [0, 20]，默认为12，和springBounciness一起决定着弹簧动画的效果
//    3.dynamicsTension 弹簧的张力
//    4.dynamicsFriction 弹簧摩擦
//    5.dynamicsMass 质量 。张力，摩擦，质量这三者可以从更细的粒度上替代springBounciness和springSpeed控制弹簧动画的效果
    
    POPSpringAnimation *springAn = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    springAn.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    springAn.beginTime = CACurrentMediaTime() + 0.5f;
    springAn.springSpeed = 13;
//    springAn.dynamicsTension = 10;
//    springAn.dynamicsFriction = 10;
//    springAn.dynamicsMass = 5;
    springAn.springBounciness = 10.f;
    [self.redView pop_addAnimation:springAn forKey:nil];
}



@end
