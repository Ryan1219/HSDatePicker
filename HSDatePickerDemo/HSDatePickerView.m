//
//  HSDatePickerView.m
//  HSDatePickerDemo
//
//  Created by Ryan on 2018/5/14.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "HSDatePickerView.h"

@interface HSDatePickerView ()

@property (nonatomic,strong) UIView *whiteView;

@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,strong) UIButton *confirmBtn;

@property (nonatomic,strong) UIDatePicker *datePicker;

- (void)hideView;

@end

@implementation HSDatePickerView

- (instancetype)initWithFrame:(CGRect)frame showView:(UIView *)showView {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = true;
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [showView addSubview:self];
        self.minimumDate = [NSDate date];
        self.maximumDate = [NSDate date];
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    
    CGFloat viewWidth = self.frame.size.width;
//    CGFloat viewHeight = self.frame.size.height;
    
    self.whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-250, ScreenWidth, 250)];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.whiteView];
    
    self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 80, 30)];
    [self.cancelBtn setTitle:@"取消" forState: UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(clickCancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.cancelBtn.layer.borderWidth = 1;
    self.cancelBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.cancelBtn.layer.cornerRadius = 4.0;
    self.cancelBtn.layer.masksToBounds = true;
    [self.whiteView addSubview:self.cancelBtn];
    
    
    self.confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(viewWidth-15-80, 10, 80, 30)];
    [self.confirmBtn setTitle:@"确定" forState: UIControlStateNormal];
    [self.confirmBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.confirmBtn addTarget:self action:@selector(clickConfirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.confirmBtn.layer.borderWidth = 1;
    self.confirmBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.confirmBtn.layer.cornerRadius = 4.0;
    self.confirmBtn.layer.masksToBounds = true;
    [self.whiteView addSubview:self.confirmBtn];
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, viewWidth, 200)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    [self.whiteView addSubview:self.datePicker];
}

//MARK:--------Action--------
- (void)clickCancelBtnAction:(UIButton *)sender {
    
    [self hideView];
}

- (void)clickConfirmBtnAction:(UIButton *)sender {
    
    [self hideView];
    NSDate *date = self.datePicker.date;
    if (self.selectDateInHSDatePickerViewBlock) {
        self.selectDateInHSDatePickerViewBlock(self, [NSDate dateFormatter:@"yyyy-MM-dd" date:date]);
    }
}

//MARK:--------Set Property--------
- (void)setCurrentDate:(NSDate *)currentDate {
    _currentDate = currentDate;
    self.datePicker.date = currentDate;
}

- (void)setMinimumDate:(NSDate *)minimumDate {
    _minimumDate = minimumDate;
    self.datePicker.minimumDate = minimumDate;
}

- (void)setMaximumDate:(NSDate *)maximumDate {
    _maximumDate = maximumDate;
    self.datePicker.maximumDate = maximumDate;
}

//MARK:--------Private--------
- (void)showView {
    self.hidden = false;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)hideView {
    self.hidden = true;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if (!CGRectContainsPoint(self.whiteView.frame, point)) {
        [self hideView];
    }
}

@end














































