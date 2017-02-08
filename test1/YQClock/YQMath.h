//
//  YQMath.h
//  test1
//
//  Created by shirly on 16/5/31.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YQMath : NSObject

//计算两点间的距离
+ (CGFloat)distanceBetweenPointsFirstPoint:(CGPoint)first secondPoint:(CGPoint)second;
//计算三点间的夹角centerPoint为中心点
+ (CGFloat)angleOfThreeCenterPoint:(CGPoint)center firstPoint:(CGPoint)first secondPoint:(CGPoint)second;
//根据度数求正弦
+ (CGFloat)sinOfAngle:(CGFloat)angle;
//根据度数求余弦
+ (CGFloat)cosOfAngle:(CGFloat)angle;


@end
