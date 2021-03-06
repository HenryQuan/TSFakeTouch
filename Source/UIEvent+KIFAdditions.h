//
//  UIEvent+KIFAdditions.h
//  KIF
//
//  Created by Thomas on 3/1/15.
//
//

#import <UIKit/UIKit.h>
#import "FixCategoryBug.h"
KW_FIX_CATEGORY_BUG_H(UIEvent_KIFAdditions)

// Exposes methods of UITouchesEvent so that the compiler doesn't complain
@interface UIEvent (KIFAdditionsPrivateHeaders)
- (void)_addTouch:(UITouch *)touch forDelayedDelivery:(BOOL)arg2;
- (void)_clearTouches;
@end

@interface UIEvent (KIFAdditions)
- (void)kif_setEventWithTouches:(NSArray *)touches;
@end
