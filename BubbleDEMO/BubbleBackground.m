//
//  BubbleBackground.m
//  BubbleDEMO
//
//  Created by liuhao on 26/12/2019.
//  Copyright © 2019 liuhao. All rights reserved.
//

#import "BubbleBackground.h"
#import "Bubble.h"
@interface BubbleBackground ()<numberObserveDelegate>{
    
    Bubble *_bubble;
    NSInteger _currentNumberOfBubbles;
}
//定时器
@property (strong, nonatomic) NSTimer *timer;
@property(nonatomic,strong)UIImageView *bottomImageView;
@end
@implementation BubbleBackground
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.bottomImageView];
        
        _currentNumberOfBubbles = 0;
        NSInteger firstProduceNum = [self arc4randomFrom:1 to:3];
        for (int i=0; i<firstProduceNum; i++) {
            [self  produceBubble];
        }
        
        [self startTimer];
    }
    return self;
}

- (void)startTimer{
    [self deleteTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(observeBubbles) userInfo:nil repeats:YES];
}

- (void)deleteTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)observeBubbles{
    
    if (_currentNumberOfBubbles < self.maxNumberOfBubbles && [self arc4randomFrom:0 to:1] == 1) { //增加随机性
        
        [self produceBubble];
    }
}

// 生成m~n之间的随机整数
-(int)arc4randomFrom:(int)m to:(int)n{
    return m + arc4random()%(n - m + 1);
}

- (void)produceBubble{
    
    _bubble = [[Bubble alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _bubble.delegate = self;
    _currentNumberOfBubbles ++;
   // [self performSelector:@selector(showNewBubble) withObject:nil afterDelay:0.5];
    [self showNewBubble];
}

- (void)showNewBubble{
    [self addSubview:_bubble];
}

- (UIImageView *)bottomImageView{
 
    if (!_bottomImageView) {
        _bottomImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _bottomImageView.image = [UIImage imageNamed:@""];
      //  _bottomImageView.backgroundColor = [UIColor orangeColor];
        _bottomImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bottomImageView;
}

- (void)dealloc {

    [self deleteTimer];
}

- (void)substractNumber{
    _currentNumberOfBubbles --;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
