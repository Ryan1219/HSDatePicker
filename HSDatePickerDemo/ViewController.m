//
//  ViewController.m
//  HSDatePickerDemo
//
//  Created by Ryan on 2018/5/14.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "ViewController.h"
#import "HSDatePickerView.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton *startDateBtn;

@property (nonatomic,strong) UIButton *endDateBtn;


@property (nonatomic, strong) NSDate *minDate;
@property (nonatomic, strong) NSDate *maxDate;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.startDateBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 100, 120, 40)];
    [self.startDateBtn setTitle:[NSDate currentDateString] forState: UIControlStateNormal];
    [self.startDateBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.startDateBtn addTarget:self action:@selector(clickStartBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.startDateBtn.layer.borderWidth = 1;
    self.startDateBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.startDateBtn.layer.cornerRadius = 4.0;
    self.startDateBtn.layer.masksToBounds = true;
    [self.view addSubview:self.startDateBtn];
    
    
    self.endDateBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 160, 120, 40)];
    [self.endDateBtn setTitle:[NSDate currentDateString] forState: UIControlStateNormal];
    [self.endDateBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.endDateBtn addTarget:self action:@selector(clickEndBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.endDateBtn.layer.borderWidth = 1;
    self.endDateBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.endDateBtn.layer.cornerRadius = 4.0;
    self.endDateBtn.layer.masksToBounds = true;
    [self.view addSubview:self.endDateBtn];
    
}



- (void)clickStartBtnAction:(UIButton *)sender {
    
    HSDatePickerView *datePickerView = [[HSDatePickerView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) showView:self.view];
    datePickerView.maximumDate = [NSDate date];
    datePickerView.currentDate = [NSDate dateFormatter:@"yyyy-MM-dd" timeString:sender.titleLabel.text];
    if (self.maxDate) {
        datePickerView.maximumDate = self.maxDate;
    }
    [datePickerView showView];
    datePickerView.selectDateInHSDatePickerViewBlock = ^(HSDatePickerView *datePickerView, NSString *time) {
        self.minDate = [NSDate dateFormatter:@"yyyy-MM-dd" timeString:time];
        [sender setTitle:time forState:UIControlStateNormal];
    };
}


- (void)clickEndBtnAction:(UIButton *)sender {
    
    HSDatePickerView *datePickerView = [[HSDatePickerView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) showView:self.view];
    datePickerView.maximumDate = [NSDate date];
    datePickerView.currentDate = [NSDate dateFormatter:@"yyyy-MM-dd" timeString:sender.titleLabel.text];
    if (self.minDate) {
        datePickerView.minimumDate = self.minDate;
    }
    [datePickerView showView];
    datePickerView.selectDateInHSDatePickerViewBlock = ^(HSDatePickerView *datePickerView, NSString *time) {
        self.maxDate = [NSDate dateFormatter:@"yyyy-MM-dd" timeString:time];
        [sender setTitle:time forState:UIControlStateNormal];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end








































