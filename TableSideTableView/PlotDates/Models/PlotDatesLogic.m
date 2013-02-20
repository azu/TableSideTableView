//
// Created by azu on 2013/02/20.
//


#import "PlotDatesLogic.h"
#import "PlotDateModel.h"
#import "NSDate-Utilities.h"

#define D_MINUTE    60
#define D_HOUR      3600
#define D_DAY       86400

@implementation PlotDatesLogic {

}
+ (NSNumber *)positionInDayForModel:(PlotDateModel *) model {
    if (model == nil) {
        return nil;
    }
    return [self positionInDayForDate:model.date];
}

+ (NSNumber *)positionInDayForDate:(NSDate *) date {
    if (date == nil) {
        return nil;
    }
    // これで必ず model >= start となる
    NSDate *startOfDay = [date dateAtStartOfDay];
    NSTimeInterval timeIntervalSinceDate = [date timeIntervalSinceDate:startOfDay];
    if (timeIntervalSinceDate == 0) {
        return @0;
    }
    return @(timeIntervalSinceDate / D_DAY);
}

@end