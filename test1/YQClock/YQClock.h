//
//  YQClock.h
//  test1
//
//  Created by shirly on 17/2/8.
//  Copyright © 2017年 shirly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YQClockDelegate <NSObject>

- (void)changedTime:(NSString *)time;

@end

@interface YQClock : UIView

@property (nonatomic, assign) id<YQClockDelegate>delegate;
@property (nonatomic, strong) UIColor *clockView;
@property (nonatomic, strong) UIColor *hourViewColor;
@property (nonatomic, strong) UIColor *minuteViewColor;


@end
