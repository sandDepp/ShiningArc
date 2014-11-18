//
//  CircleView.m
//  ShiningArc
//
//  Created by sand on 14-11-18.
//  Copyright (c) 2014年 sand. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        radius = SH_SLIDER_SIZE/2 - 60;
        self.backgroundColor = [UIColor whiteColor];
      
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    

    /** Create THE MASK Image **/
    UIGraphicsBeginImageContext(CGSizeMake(SH_SLIDER_SIZE,SH_SLIDER_SIZE));
    CGContextRef imageCtx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(imageCtx, self.frame.size.width/2  , self.frame.size.height/2, radius, 0, 2*M_PI, 0);
    [[UIColor redColor]set];
    
    //Use shadow to create the Blur effect
    CGContextSetShadowWithColor(imageCtx, CGSizeMake(0, 0), self.angle/20,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 [UIColor blackColor].CGColor);
    
    //define the path
    CGContextSetLineWidth(imageCtx, SH_LineWidth);
    CGContextDrawPath(imageCtx, kCGPathStroke);
    
    //save the context content into the image mask
    CGImageRef mask = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext());
    UIGraphicsEndImageContext();
    
    // Clip Context to the mask
    CGContextSaveGState(context);
    CGContextClipToMask(context, self.bounds, mask);
    CGImageRelease(mask);
    
    /*draw view with gradient*/
   
    CGFloat components[8] = {
        0.0, 0.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 1.0};
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef   gradient  = CGGradientCreateWithColorComponents(baseSpace, components, NULL, 2);
    CGColorSpaceRelease(baseSpace);
    baseSpace = NULL;
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    //Draw the gradient
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient), gradient = NULL;
    
    //环形渐变
    //    CGContextDrawRadialGradient(ctx, gradient, self.center, 49, self.center, 70, 0);
}


@end
