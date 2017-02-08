//
//  YQClock.m
//  test1
//
//  Created by shirly on 17/2/8.
//  Copyright © 2017年 shirly. All rights reserved.
//

#import "YQClock.h"
#import "YQMath.h"

#define secondAngle (0.5/60)

#define minuteAngle 0.5

#define hourAngle 30

@interface YQClock ()

/****************/
/*******时针******/
//时针
@property (nonatomic, strong) UIView *hourView;
//点击的view
@property (nonatomic, strong) UIView *hourClickView;
@property (nonatomic, assign) CGPoint hourClickViewCenter;
//时针一共旋转的角度
@property (nonatomic, assign) CGFloat hourTotalAngle;
/*******时针******/
/*******分针******/
//分针
@property (nonatomic, strong) UIView *minuteView;
//点击的view
@property (nonatomic, strong) UIView *minuteClickView;
@property (nonatomic, assign) CGPoint minutClickViewCenter;
//分针一共旋转的角度
@property (nonatomic, assign) CGFloat minuteTotalAngle;
/*******时针******/
//参考坐标view
@property (nonatomic, strong) UIView *referenceView;
//开始移动的点
@property (nonatomic, assign) CGPoint startPoint;
//移动过程中的点
@property (nonatomic, assign) CGPoint movePoint;
/****************/

@end

@implementation YQClock
- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self addClock];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
         [self addClock];
    }
    return self;
}
- (void)setHourViewColor:(UIColor *)hourViewColor {
    _hourViewColor = hourViewColor;
    self.hourClickView.backgroundColor = _hourViewColor;
}
- (void)setMinuteViewColor:(UIColor *)minuteViewColor {
    _minuteViewColor = minuteViewColor;
    self.minuteClickView.backgroundColor = _minuteViewColor;
}
- (void)addClock {
    self.backgroundColor = [UIColor greenColor];
    
    self.hourTotalAngle = 0.0;
    self.minuteTotalAngle = 0.0;
    
    UIView *referenceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self addSubview:referenceView];
    referenceView.backgroundColor = [UIColor clearColor];
    self.referenceView = referenceView;
    
    /********时针*********/
    UIView *hourView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, referenceView.frame.size.width,  referenceView.frame.size.width)];
    [referenceView addSubview:hourView];
    hourView.backgroundColor = [UIColor clearColor];
    hourView.layer.masksToBounds = YES;
    hourView.layer.cornerRadius = hourView.frame.size.width/2;
    self.hourView = hourView;
    
    //指针
    UIView *hourPointerView = [[UIView alloc]initWithFrame:CGRectMake(hourView.center.x, hourView.center.y - 70, 8, 80)];
    [hourView addSubview:hourPointerView];
    hourPointerView.backgroundColor = [UIColor blackColor];
    
    UIView *hourClickView = [[UIView alloc]initWithFrame:CGRectMake((referenceView.frame.size.width/4), 0,referenceView.frame.size.width/2, referenceView.frame.size.height/2)];
    [referenceView addSubview:hourClickView];
    hourClickView.backgroundColor = [UIColor colorWithRed:0.000 green:0.888 blue:1.000 alpha:0.2];
    hourClickView.layer.masksToBounds = YES;
    hourClickView.layer.cornerRadius = hourClickView.frame.size.width/2;
    self.hourClickView = hourClickView;
    /********时针*********/
    
    /********分针*********/
    UIView *minuteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  referenceView.frame.size.width,  referenceView.frame.size.width)];
    [referenceView addSubview:minuteView];
    minuteView.backgroundColor = [UIColor clearColor];
    minuteView.layer.masksToBounds = YES;
    minuteView.layer.cornerRadius = minuteView.frame.size.width/2;
    self.minuteView = minuteView;
    
    UIView *minutePointerView = [[UIView alloc]initWithFrame:CGRectMake(hourView.center.x, hourView.center.y - 100, 3, 125)];
    [minuteView addSubview:minutePointerView];
    minutePointerView.backgroundColor = [UIColor blackColor];
    
    UIView *minutClickView = [[UIView alloc]initWithFrame:CGRectMake((referenceView.frame.size.width/4), 0,referenceView.frame.size.width/2, referenceView.frame.size.height/2)];
    [referenceView addSubview:minutClickView];
    minutClickView.backgroundColor = [UIColor colorWithRed:0.000 green:0.888 blue:1.000 alpha:0.2];
    minutClickView.layer.masksToBounds = YES;
    minutClickView.layer.cornerRadius = minutClickView.frame.size.width/2;
    self.minuteClickView = minutClickView;
    /********分针*********/
    
    
}
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self.referenceView];
    self.movePoint = self.startPoint;
    self.hourClickViewCenter = self.hourClickView.center;
    self.minutClickViewCenter = self.minuteClickView.center;
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:self.referenceView];
    UIView *moveView = [self whichViewToMove];
    CGFloat distance = self.frame.size.width/4.0;
    
    if (moveView == self.hourView) {
        
        CGFloat distance1 =
        [YQMath distanceBetweenPointsFirstPoint:self.startPoint secondPoint:self.hourClickViewCenter];
        CGFloat distance2 =
        [YQMath distanceBetweenPointsFirstPoint:movePoint secondPoint:self.hourClickView.center];
        
        if (distance1 <= distance && distance2 <= distance) {
            
            CGFloat angle =
            [YQMath angleOfThreeCenterPoint:self.hourView.center firstPoint:self.movePoint secondPoint:movePoint];
            self.hourView.transform = CGAffineTransformRotate(self.hourView.transform, angle);
            
            self.hourTotalAngle += angle;
            
            CGPoint center = [self getCenterPoint:self.hourTotalAngle/M_PI*180];
            if (center.x >= 0 && center.y >= 0) {
                
                self.hourClickView.center = center;
            }
        }
        
        self.movePoint = movePoint;
        
        //多余一圈就清理下总共的角度，以免超出CGFloat的最大值
        if (_hourTotalAngle > M_PI*2) {
            _hourTotalAngle = _hourTotalAngle - floorf(_hourTotalAngle/(M_PI*2))*(M_PI*2);
        }
        [self configTimeLabel];
        
    }else if (moveView == self.minuteView) {
        
        CGFloat distance1 =
        [YQMath distanceBetweenPointsFirstPoint:self.startPoint secondPoint:self.minutClickViewCenter];
        CGFloat distance2 =
        [YQMath distanceBetweenPointsFirstPoint:movePoint secondPoint:self.minuteClickView.center];
        
        if (distance1 <= distance && distance2 <= distance) {
            
            CGFloat angle =
            [YQMath angleOfThreeCenterPoint:self.minuteView.center firstPoint:self.movePoint secondPoint:movePoint];
            self.minuteView.transform = CGAffineTransformRotate(self.minuteView.transform, angle);
            
            self.minuteTotalAngle += angle;
            
            CGPoint center = [self getCenterPoint:self.minuteTotalAngle/M_PI*180];
            if (center.x >= 0 && center.y >= 0) {
                
                self.minuteClickView.center = center;
            }
        }
        
        self.movePoint = movePoint;
        
        if (_minuteTotalAngle > M_PI*2) {
            _minuteTotalAngle = _minuteTotalAngle - floorf(_minuteTotalAngle/(M_PI*2))*(M_PI*2);
        }
    }
    
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}
//根据旋转的角度算时间
- (void)configTimeLabel {
    
    CGFloat a = floorf(_hourTotalAngle/M_PI*180/ 360);
    CGFloat b = _hourTotalAngle/M_PI*180 - a*360;
    CGFloat c = (b - floorf(b/hourAngle)*hourAngle)/minuteAngle;
    CGFloat d = (_hourTotalAngle/M_PI*180 - a*360 - floorf(b/30)*30-floorf(c)*0.5)/secondAngle;
    
    NSInteger hour = [[NSNumber numberWithFloat:floorf(b/30)] integerValue];
    NSInteger minute = [[NSNumber numberWithFloat:floorf(c)] integerValue];
    NSInteger second = [[NSNumber numberWithFloat:floorf(d)] integerValue];
    
  
//    NSLog(@"%f",_hourTotalAngle);
    
    if ([self.delegate respondsToSelector:@selector(changedTime:)]) {
        [self.delegate changedTime:[NSString stringWithFormat:@"%02ld:%02ld:%02ld",hour,minute,second]];
    }
}
//得到clickView的中心点
- (CGPoint )getCenterPoint:(CGFloat)angle {
    
    CGFloat x = self.frame.size.width/2 + self.frame.size.width/4 * [YQMath sinOfAngle:(angle)];
    CGFloat y = self.frame.size.width/4 + self.frame.size.width/4 - self.frame.size.width/4 * [YQMath cosOfAngle:(angle)];
    
    return CGPointMake(x, y);
}
//判断点击的距离里哪个view比较近，就让哪个view动
- (UIView *)whichViewToMove {
    
    CGFloat distanceBetweenHourToStartP =
    [YQMath distanceBetweenPointsFirstPoint:self.startPoint secondPoint:self.hourClickViewCenter];
    CGFloat distanceBetweenMinuteToStartP =
    [YQMath distanceBetweenPointsFirstPoint:self.startPoint secondPoint:self.minutClickViewCenter];
    //判断距离时针和分针那个比较近
    if (distanceBetweenHourToStartP < distanceBetweenMinuteToStartP) {
        return self.hourView;
    }else{
        return self.minuteView;
    }
}

@end
