#import "Source/PTFakeTouch.h"

%ctor {
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(100,100) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(100,100) withTouchPhase:UITouchPhaseEnded];
}