//
//  ViewController.m
//  BubbleDEMO
//
//  Created by liuhao on 24/12/2019.
//  Copyright © 2019 liuhao. All rights reserved.
//

#import "ViewController.h"
#import "Bubble.h"
#import "AppDelegate.h"

@interface ViewController (){
   
    AppDelegate *appDelegate;
    CADisplayLink *_displayLink;
    Bubble *_bubble;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.numberOfBubbles = 0;
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(observeBubbles)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}

- (void)observeBubbles{
    
    if (appDelegate.numberOfBubbles < 8) {
        
        [self toBubble];
    }
}

- (void)toBubble{
    
    _bubble = [[Bubble alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    appDelegate.numberOfBubbles ++;
    [self performSelector:@selector(showNewBubble) withObject:nil afterDelay:0.3];
}

- (void)showNewBubble{
     [self.view addSubview:_bubble];
}

- (void)dealloc {
    [_displayLink invalidate];
    _displayLink = nil;
}
/*
- (void)onMovingTimer{
    
    CGFloat x = self.fireBall.center.x;
    CGFloat y = self.fireBall.center.y;
    
    // 改变位置
    self.fireBall.center = CGPointMake(self.fireBall.center.x + self.point.x, self.fireBall.center.y + self.point.y);
    
    // 边界碰撞判断
    CGPoint tempPoint = self.point;
    if (self.fireBall.center.x > SCREEN_WIDTH/2 - kBallRadius || self.fireBall.center.x < kBallRadius) {
        tempPoint.x = - self.point.x;
        self.point = tempPoint;
    }
    if (self.fireBall.center.y > SCREEN_HEIGHT - kBallRadius || self.fireBall.center.y < kBallRadius) {
      //  tempPoint.y = - self.point.y;
      //  self.point = tempPoint;
        [self.fireBall removeFromSuperview];
    }
    
    // 让fireBall在上面
    [self.view bringSubviewToFront:self.fireBall];
}



- (UIImageView *)fireBall{
    
    if (!_fireBall) {
        _fireBall = [[UIImageView alloc] init];
        _fireBall.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.6];
        _fireBall.frame = CGRectMake(0, 0, kBallRadius*2, kBallRadius*2);
        _fireBall.layer.cornerRadius = kBallRadius;
    }
    return _fireBall;
}
*/
@end
