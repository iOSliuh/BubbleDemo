//
//  Bubble.h
//  BubbleDEMO
//
//  Created by liuhao on 25/12/2019.
//  Copyright © 2019 liuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol numberObserveDelegate <NSObject>
- (void)substractNumber;
@end
@interface Bubble : UIView
@property(nonatomic,weak)id <numberObserveDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
