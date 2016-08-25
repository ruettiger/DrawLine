//
//  DLViewController.m
//  DrawLine
//
//  Created by ruettiger on 08/25/2016.
//  Copyright (c) 2016 ruettiger. All rights reserved.
//

#import "DLViewController.h"
#import "MFSDDrawLineView.h"
@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MFSDDrawLineView* _MFSDDrawLineView = [[MFSDDrawLineView alloc]initWithFrame:self.view.bounds];
    _MFSDDrawLineView.backgroundColor = [UIColor redColor];
    _MFSDDrawLineView.currentLineWidth = 5.0f;
    _MFSDDrawLineView.currentLineColor = [UIColor yellowColor];
    [self.view addSubview:_MFSDDrawLineView];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
