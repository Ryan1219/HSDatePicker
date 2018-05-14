//
//  NSDate+Extension.h
//  HSDatePickerDemo
//
//  Created by Ryan on 2018/5/14.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+ (NSString *)currentDateString;

+ (NSString *)dateFormatter:(NSString *)dateFormatter date:(NSDate *)date;

+ (NSDate *)dateFormatter:(NSString *)dateFormatter timeString:(NSString *)timeString;

@end
