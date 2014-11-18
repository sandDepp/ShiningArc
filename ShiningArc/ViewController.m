//
//  ViewController.m
//  ShiningArc
//
//  Created by sand on 14-11-18.
//  Copyright (c) 2014年 sand. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CircleView *circle = [[CircleView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 300.0f)];
    [self.view addSubview:circle];
	// Do any additional setup after loading the view, typically from a nib.

    UIView *gradientView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 300.0f, 320.0f, 100.0f)];
    gradientView.backgroundColor = [UIColor redColor];
    CAGradientLayer *gradientLayer = [self flavescentGradientLayer];
    gradientLayer.frame = gradientView.bounds;
    [gradientView.layer insertSublayer:gradientLayer atIndex:0];
    [self.view addSubview:gradientView];
}

/**
 *  获取渐变色
 *  @return
 *  @date 2014-11-18
 *  @author
 */
- (CAGradientLayer *)flavescentGradientLayer
{
    
    UIColor *topColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
    UIColor *bottomColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    
    NSArray *gradientLocations = [NSArray arrayWithObjects: [NSNumber numberWithInt:0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    /*
    gradientLayer.startPoint = CGPointMake(0, 100.0);
    gradientLayer.endPoint = CGPointMake(320, 100);
     */
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}


@end
