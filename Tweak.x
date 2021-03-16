#import "Source/PTFakeTouch.h"
#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#include <stdlib.h>

static NSTimer *timer;
static CGSize screenSize;

%ctor {
    screenSize = [[UIScreen mainScreen] bounds].size;

    timer = [NSTimer timerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *timer) {
            for (int i = 0; i < 3; i++) {
                CGPoint point = CGPointMake(arc4random_uniform(screenSize.width), arc4random_uniform(screenSize.height));
                NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:point withTouchPhase:UITouchPhaseBegan];
                [PTFakeMetaTouch fakeTouchId:pointId AtPoint:point withTouchPhase:UITouchPhaseEnded];
                NSLog(@"FakeTouch: touch %d", i + 1);
            }
        }];
    [timer fire];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"FakeTouch: 10s delay");
    });

    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}
