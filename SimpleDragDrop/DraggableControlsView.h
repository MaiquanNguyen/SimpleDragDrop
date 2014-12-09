//
//  DraggableControlsView.h
//  SimpleDragDrop
//
//  Created by Nguyễn Mai Quân on 2/27/14.
//  Copyright (c) 2014 Nguyen Mai Quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DraggableControl.h"


@interface DraggableControlsView : UIView {
    CGPoint startPoint;
    BOOL draggable;
    BOOL enableCanceled;
    NSMutableArray* controls;
}

- (void)addGridControl:(DraggableControl*) control;

@end
