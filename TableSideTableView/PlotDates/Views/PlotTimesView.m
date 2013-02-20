//
// Created by azu on 2013/02/20.
//


#import <CoreGraphics/CoreGraphics.h>
#import "PlotTimesView.h"
#import "PlotDatesLogic.h"
#import "NSDate+AZBuilder.h"
#import "NSDate-Utilities.h"


@implementation PlotTimesView {

}

- (void)drawButtonWithModel:(NSDate *) date {
    NSNumber *ratioXPosition = [PlotDatesLogic positionInDayForDate:date];
    if (ratioXPosition == nil || [ratioXPosition isEqualToNumber:@0]) {

    }
    CGFloat width = self.bounds.size.width;
    CGFloat buttonXPosition = [ratioXPosition floatValue] * width;
    UILabel *label = [self createLabel:buttonXPosition];
    if ([date hour] == 23 && [date minute] == 59 && [date seconds] == 59) {
        label.text = @"24";

    }else{
        label.text = [NSString stringWithFormat:@"%d",[date hour]];
    }
    [self addSubview:label];
}

- (UILabel *)createLabel:(CGFloat) buttonXPosition {
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, 24, self.frame.size.height);
    label.backgroundColor = [UIColor clearColor];
    CGRect frame = label.frame;
    frame.origin.x = buttonXPosition - (label.frame.size.width / 2);
    frame.origin.y = (self.bounds.size.height - label.frame.size.height) / 2;
    label.frame = frame;
    return label;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self drawTimeLabel];
}

- (void)drawTimeLabel {

    [self cleanup];
// 0..3.....24
    for (int i = 0; i < 8; i++) {
        NSDate *date = [NSDate dateByUnit:@{
                AZDateBuilderUnit.hour : @(i * 3),
                AZDateBuilderUnit.minute : @0,
                AZDateBuilderUnit.second : @0
        }];
        [self drawButtonWithModel:date];
    }
    NSDate *date = [NSDate dateByUnit:@{
            AZDateBuilderUnit.hour : @(23),
            AZDateBuilderUnit.minute : @59,
            AZDateBuilderUnit.second : @59
    }];
    [self drawButtonWithModel:date];
}

#pragma mark - cleanup
- (void)cleanup {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self drawTimeLabel];
}

@end