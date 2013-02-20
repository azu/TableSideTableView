//
// Created by azu on 2013/02/20.
//


#import "PlotDateModel.h"


@implementation PlotDateModel {

}
- (id)initWithDate:(NSDate *) date {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    self.date = date;

    return self;
}

+ (id)modelWithDate:(NSDate *) date {
    return [[self alloc] initWithDate:date];
}

@end