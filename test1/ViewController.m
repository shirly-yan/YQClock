//
//  ViewController.m
//  test1
//
//  Created by shirly on 17/2/8.
//  Copyright © 2017年 shirly. All rights reserved.
//

#import "ViewController.h"
#import "YQClock.h"

@interface ViewController ()<YQClockDelegate>

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YQClock *clock = [[YQClock alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];
    clock.backgroundColor = [UIColor brownColor];
    clock.hourViewColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:0.2];
    clock.minuteViewColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.2];
    clock.delegate = self;
    [self.view addSubview:clock];
    
}
- (void)changedTime:(NSString *)time {
    self.timeLabel.text = time;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
