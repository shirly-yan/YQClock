//
//  YQMath.m
//  test1
//
//  Created by shirly on 16/5/31.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import "YQMath.h"

@implementation YQMath

+ (CGFloat)distanceBetweenPointsFirstPoint:(CGPoint)first secondPoint:(CGPoint)second {
    
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    
    return sqrt(deltaX*deltaX + deltaY*deltaY);
                
}
//
//+ (CGFloat)angleOfThreeCenterPoint:(CGPoint)center firstPoint:(CGPoint)first secondPoint:(CGPoint)second {
//    
//    float dx1, dx2, dy1, dy2;
//    float angle;
//    
//    dx1 = first.x - center.x;
//    dy1 = first.y - center.y;
//    
//    dx2 = second.x - center.x;
//    
//    dy2 = second.y - center.y;
//    
//    float c = (float)sqrt(dx1 * dx1 + dy1 * dy1) * (float)sqrt(dx2 * dx2 + dy2 * dy2);
//    
//    if (c == 0) return -1;
//    
//    angle = (float)acos((dx1 * dx2 + dy1 * dy2) / c);
//    
//    
//    return angle; 
//}

+ (CGFloat)angleOfThreeCenterPoint:(CGPoint)center firstPoint:(CGPoint)first secondPoint:(CGPoint)second {
    
    
    float dx = first.x - center.x;
    float dy = first.y - center.y;
    float deltaAngle = atan2(dy,dx);
    
    
    float dx1 = second.x  - center.x;
    float dy1 = second.y  - center.y;
    float ang = atan2(dy1,dx1);
    
    float angleDifference = deltaAngle - ang;
    
    
    return -angleDifference;
}
+ (CGFloat)sinOfAngle:(CGFloat)angle {
    
    angle = M_PI/180.0*angle;
    
    return sin(angle);
}
+ (CGFloat)cosOfAngle:(CGFloat)angle {

    angle = M_PI/180.0*angle;
    
    return cos(angle);
}

@end
