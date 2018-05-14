//
//  NSDate+Extension.m
//  HSDatePickerDemo
//
//  Created by Ryan on 2018/5/14.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)currentDateString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)dateFormatter:(NSString *)dateFormatter date:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormatter];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFormatter:(NSString *)dateFormatter timeString:(NSString *)timeString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:dateFormatter];
    return [formatter dateFromString:timeString];
    
}

@end
