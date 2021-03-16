#import "Source/PTFakeTouch.h"
#import <Foundation/Foundation.h>

NSTimer *timer;

%ctor {
    timer = [NSTimer timerWithTimeInterval:0.2 repeats:YES block:^(NSTimer *timer) {
        dispatch_async(dispatch_get_main_queue(), ^{
            CGPoint point = CGPointMake(100, 300);
            NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:point withTouchPhase:UITouchPhaseBegan];
            [PTFakeMetaTouch fakeTouchId:pointId AtPoint:point withTouchPhase:UITouchPhaseEnded];
            NSLog(@"FakeTouch: touch");
        });
    }];
    [timer fire];
}
