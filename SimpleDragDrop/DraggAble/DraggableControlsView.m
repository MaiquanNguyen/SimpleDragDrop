//
//  DraggableControlsView.m
//  SimpleDragDrop
//
//  Created by Nguyễn Mai Quân on 2/27/14.
//  Copyright (c) 2014 Nguyen Mai Quan. All rights reserved.
//

#import "DraggableControlsView.h"

@implementation DraggableControlsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        controls = [NSMutableArray array];
    }
    return self;
}

//add ui control
- (void)addGridControl:(DraggableControl *)control {
    [control addTarget:self
                action:@selector(touch:event:)
      forControlEvents:UIControlEventTouchDown];
    [control addTarget:self
                action:@selector(touchUp:event:)
      forControlEvents:UIControlEventTouchUpInside];
    [control addTarget:self
                action:@selector(draginside:event:)
      forControlEvents:UIControlEventTouchDragInside];
    [controls addObject:control];
    [self addSubview:control];
}
// change size of draggable view after drag and drop
- (void) layout {
    CGRect rect = self.frame;
    rect.size.height = 0;
    for (DraggableControl* control in controls) {
        CGFloat height = control.frame.origin.y + control.frame.size.height;
        rect.size.height = MAX(rect.size.height, height);
    }
    
    rect.size.height += 5;
    [UIView animateWithDuration:0.1 animations:^{
        self.frame = rect;
    }];
}

// add event vào mỗi control để nhận action khi tao vào control
- (IBAction)touch:(DraggableControl*) control event:(UIEvent*) event {
    enableCanceled = NO;
    startPoint = [[[event allTouches] anyObject] locationInView:control];
    [self performSelector:@selector(enableDraggable:) withObject:control afterDelay:0.1];
}

//bắt đầu drag
- (void)enableDraggable:(DraggableControl*)control {
    if (enableCanceled) {
        return;
    }
    draggable = YES;
    [self insertSubview:control atIndex:[controls count] -1];
    
    [UIView animateWithDuration:0.2 animations:^{
        control.alpha = 0.5;
        CGRect rect = control.frame;
        rect.origin.x += 5;
        rect.origin.y += 5;
        rect.size.width -= 5;
        rect.size.height -= 5;
        control.frame = rect;
    }];
}

//bỏ drag
- (IBAction)touchUp:(DraggableControl *)control event:(UIEvent *)event {
    enableCanceled = YES;
    if (!draggable) return;
    [UIView animateWithDuration:0.3 animations:^{
        control.alpha = 1;
        CGRect rect = control.frame;
        rect.origin.x -= 5;
        rect.origin.y -= 5;
        rect.size.width += 5;
        rect.size.height += 5;
        control.frame = rect;
    } completion:^(BOOL finished) {
        draggable = NO;
        [self layout];
    }];
}

//khi đang drag
- (IBAction)draginside:(DraggableControl*)control event:(UIEvent*)event {
    CGPoint point = [[[event allTouches] anyObject] locationInView:self];
    CGRect rect = control.frame;
    rect.origin.x = point.x - startPoint.x + 5;
    rect.origin.y = point.y - startPoint.y + 5;
    control.frame = rect;
}

@end
