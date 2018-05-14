//
//  HSDatePickerView.h
//  HSDatePickerDemo
//
//  Created by Ryan on 2018/5/14.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSDatePickerView : UIView

- (instancetype)initWithFrame:(CGRect)frame showView:(UIView *)showView;

// 最初/小时间(一般为左边值)
@property (nonatomic,strong) NSDate *minimumDate;
// 截止时间(一般为右边值)
@property (nonatomic,strong) NSDate *maximumDate;
// 当前选择时间
@property (nonatomic,strong) NSDate *currentDate;


@property (nonatomic,copy) void (^selectDateInHSDatePickerViewBlock)(HSDatePickerView *datePickerView,NSString *time);

- (void)showView;


@end

































































