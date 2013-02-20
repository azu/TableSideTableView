//
// Created by azu on 2013/02/20.
//


#import <Foundation/Foundation.h>


@interface PlotDateModel : NSObject
@property(nonatomic, strong) NSDate *date;

- (id)initWithDate:(NSDate *) date;

+ (id)modelWithDate:(NSDate *) date;

@end