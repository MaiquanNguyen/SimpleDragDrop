//
//  ViewController.m
//  SimpleDragDrop
//
//  Created by Nguyễn Mai Quân on 2/27/14.
//  Copyright (c) 2014 Nguyen Mai Quan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    DraggableControlsView* draggableControlView = [[DraggableControlsView alloc] initWithFrame:CGRectMake(10, 20, 300, 400)];
    draggableControlView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:draggableControlView];
    
    DraggableControl* control = [[DraggableControl alloc] initWithFrame:CGRectMake(100, 100, 100, 150)];
    control.backgroundColor = [UIColor redColor];
    [draggableControlView addGridControl:control];
    
    control = [[DraggableControl alloc] initWithFrame:CGRectMake(10, 10, 200, 150)];
    control.backgroundColor = [UIColor blackColor];
    [draggableControlView addGridControl:control];
    
    control = [[DraggableControl alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    control.backgroundColor = [UIColor orangeColor];
    control.alpha = 0.7;
    [draggableControlView addGridControl:control];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
