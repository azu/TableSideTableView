//
// Created by azu on 2013/02/20.
//


#import <Foundation/Foundation.h>

@class PlotDateModel;


@interface PlotDatesLogic : NSObject

// Modelを渡して、24時間中のどのいちなのかを返す

// 24時間をwidthと考える
// 60*60*24 = 24時間
// 渡されるdate timeIntervalSinceDate startOfDate
+ (NSNumber *)positionInDayForModel:(PlotDateModel *) model;

+ (NSNumber *)positionInDayForDate:(NSDate *) date;
@end