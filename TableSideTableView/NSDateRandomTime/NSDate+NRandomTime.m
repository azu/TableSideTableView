//
// Created by azu on 2013/02/20.
//


#import "NSDate+NRandomTime.h"


@implementation NSDate (NRandomTime)

+ (NSDate *)randomDateTime {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [comps setMonth:arc4random_uniform(12)];
    NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[currentCalendar dateFromComponents:comps]];
    [comps setDay:arc4random_uniform(range.length)];
    [comps setHour:arc4random() % 25];
    [comps setMinute:arc4random() % 60];
    [comps setSecond:arc4random() % 60];
    return [currentCalendar dateFromComponents:comps];
}
@end