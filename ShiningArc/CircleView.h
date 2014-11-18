//
//  CircleView.h
//  ShiningArc
//
//  Created by sand on 14-11-18.
//  Copyright (c) 2014年 sand. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Helper Functions **/
#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )
#define ToDeg(rad)		( (180.0 * (rad)) / M_PI )
#define SQR(x)			( (x) * (x) )

/** Parameter **/
#define SH_LineWidth   60
#define SH_SLIDER_SIZE 320

@interface CircleView : UIView
{
    int radius;
}
@property (nonatomic, assign)int angle;
@end
