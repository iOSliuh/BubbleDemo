//
//  Bubble.m
//  BubbleDEMO
//
//  Created by liuhao on 25/12/2019.
//  Copyright © 2019 liuhao. All rights reserved.
//

#import "Bubble.h"
#import "AppDelegate.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation Bubble{
    
    CGFloat _radius;
    CGPoint _point;// 位移速度
    CADisplayLink *_displayLink;
    
    UIView *_bubble;
    int leftOrRight; // 气泡左边或右边冒出
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        [self initData];
        [self drawBubble];
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onMoving)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}


#pragma mark - 初始化
- (void)initData {
    
    int randomRadius = [self arc4randomFrom:20 to:60];// 80 140
    _radius = randomRadius;
    
    leftOrRight = [self arc4randomFrom:0 to:1];
    _point = CGPointMake(leftOrRight==0?_radius/140:-_radius/140, - _radius/50);
    
}

//- (void)drawRect:(CGRect)rect {
- (void)drawBubble {
    
    int y = [self arc4randomFrom:0 to:_radius*2];
    _bubble = [[UIView alloc] initWithFrame:CGRectMake(leftOrRight==0?0:SCREEN_WIDTH-_radius*2,SCREEN_HEIGHT - y, _radius*2, _radius*2)];
    _bubble.layer.cornerRadius = _radius;
    _bubble.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.6];
    [self addSubview:_bubble];
}

- (void)onMoving{
    
    _bubble.center = CGPointMake(_bubble.center.x + _point.x, _bubble.center.y + _point.y);
    // 边界碰撞判断
    CGPoint tempPoint = _point;
    if (leftOrRight == 0) {
        if (_bubble.center.x  >  SCREEN_WIDTH/2 - _radius || _bubble.center.x < _radius) {
            tempPoint.x = - _point.x;
            _point = tempPoint;
        }
    }else{
        if (_bubble.center.x < SCREEN_WIDTH / 2 + _radius || _bubble.center.x > SCREEN_WIDTH - _radius ) {
            tempPoint.x = - _point.x;
            _point = tempPoint;
        }
    }
    if (_bubble.center.y < _radius ) {
        [_bubble removeFromSuperview];
        [_displayLink invalidate];
        _displayLink = nil;
        
        AppDelegate *myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        myDelegate.numberOfBubbles = myDelegate.numberOfBubbles -1;
    }
    
    [self bringSubviewToFront:_bubble];
    
}

// 生成m~n之间的随机整数
-(int)arc4randomFrom:(int)m to:(int)n{
    return m + arc4random()%(n - m + 1);
}

- (void)dealloc {
    [_displayLink invalidate];
    _displayLink = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
