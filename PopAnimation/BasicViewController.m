//
//  BasicViewController.m
//  PopAnimation
//
//  Created by lx on 16/9/9.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "BasicViewController.h"


@interface BasicViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *netWork;

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Y轴平移
    POPBasicAnimation *basicAn = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    basicAn.toValue = @(self.redView.center.y + 100);
    //延迟0.5s执行
    basicAn.beginTime = CACurrentMediaTime() + 0.5f;
    basicAn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    basicAn.duration = 1.5;
   
    
    
    POPBasicAnimation *basicAn1= [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];
    basicAn1.toValue = [NSValue valueWithCGSize:CGSizeMake(80, 80)];
    basicAn1.beginTime = CACurrentMediaTime() + 0.5f;
    basicAn1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    basicAn1.duration = 1.5;
    
   
    POPBasicAnimation *basicAn2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    basicAn2.toValue = [NSNumber numberWithFloat:M_PI_4];
    basicAn2.beginTime = CACurrentMediaTime() + 0.5f;
    basicAn2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.redView pop_addAnimation:basicAn forKey:nil];
    [self.redView pop_addAnimation:basicAn1 forKey:nil];
    [self.redView.layer pop_addAnimation:basicAn2 forKey:nil];
    
    
  
}

- (IBAction)loginAction:(id)sender 
{
    UIButton *button  = (UIButton *)sender;

    button.userInteractionEnabled = false;

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    POPSpringAnimation *scaleXY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleXY.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleXY.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleXY.springBounciness = 20;
    [self.loginButton.layer pop_addAnimation:scaleXY forKey:nil];

    
    POPSpringAnimation *springAn = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    springAn.velocity = @2000;
    springAn.springSpeed = 20;
    springAn.springBounciness = 20;
    [springAn setCompletionBlock:^(POPAnimation * animation, BOOL success) {
        if (success) {
            button.userInteractionEnabled = YES;
        }
    }];
    
    [self NetWordHide];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
        [self.loginButton.layer pop_addAnimation:springAn forKey:nil];
        [self NetWorkShow];
    });
 
}


- (void)NetWorkShow
{
    self.netWork.hidden = false;
    POPSpringAnimation *springAn = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    springAn.springSpeed = 20;
    springAn.springBounciness = 20;
    springAn.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    [self.netWork.layer pop_addAnimation:springAn forKey:nil];
    
    POPSpringAnimation *springAn1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    springAn1.springBounciness = 20;
    springAn1.springSpeed = 20;
    springAn1.toValue = @(self.netWork.center.y - self.loginButton.intrinsicContentSize.height);
    [self.netWork.layer pop_addAnimation:springAn1 forKey:nil];
}

- (void)NetWordHide
{
    self.netWork.hidden = YES;
    
    POPBasicAnimation *basicAn = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    basicAn.toValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
    [self.netWork.layer pop_addAnimation:basicAn forKey:nil];
    
    POPBasicAnimation *basic2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    basic2.toValue = @(self.loginButton.layer.position.y);
    [self.netWork.layer pop_addAnimation:basic2 forKey:nil];
}

@end
